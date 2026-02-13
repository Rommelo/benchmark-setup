IMG_LINUX="docker.io/rommeloo/n-body-linux:v1"
RUNTIME_LINUX="io.containerd.runc.v2"

IMG_WASM="docker.io/rommeloo/n-body-runwasi:v1"
RUNTIME_WASM="io.containerd.wasmtime.v1"

IMG_SPIN="docker.io/rommeloo/n-body-spin:v1"
RUNTIME_SPIN="io.containerd.spin.v2"

OUTPUT_CSV="results_hyperfine.csv"
OUTPUT_MD="results_hyperfine.md"

prepare_environment() {
    echo "---------------------------------------------------"
    echo "[Setup] Cleaning up old containers and images..."
    # Alles stoppen und löschen, was stören könnte
    sudo ctr tasks ls -q | xargs -r sudo ctr tasks kill > /dev/null 2>&1
    sudo ctr tasks ls -q | xargs -r sudo ctr tasks rm > /dev/null 2>&1
    sudo ctr containers ls -q | xargs -r sudo ctr containers rm > /dev/null 2>&1
    
    # Content Store bereinigen
    sudo ctr images list -q | xargs -r sudo ctr images remove > /dev/null 2>&1
    sudo ctr content prune > /dev/null 2>&1
    
    echo "[Setup] Pulling Images to local disk (Warm Disk State)..."
    sudo ctr images pull  $IMG_LINUX > /dev/null
    sudo ctr images pull  $IMG_WASM > /dev/null
    sudo ctr images pull  $IMG_SPIN > /dev/null
    echo "---------------------------------------------------"
}

# 1. Einmaliges Setup (Clean & Pull)
prepare_environment

# 2. Der "Magic Command" für den Cold Start
# Dieser Befehl läuft VOR JEDEM EINZELNEN RUN.
# Er stellt sicher, dass:
# a) Eventuelle Leichen (abgestürzte Container) gelöscht werden (damit ID frei ist)
# b) Der Page-Cache (RAM) gelöscht wird -> Erzwingt I/O von der Festplatte
PREPARE_CMD="sudo ctr tasks kill bench-linux bench-wasm bench-spin >/dev/null 2>&1; \
             sudo ctr containers rm bench-linux bench-wasm bench-spin >/dev/null 2>&1; \
             sync; echo 3 | sudo tee /proc/sys/vm/drop_caches > /dev/null"

echo "Starting Hyperfine Benchmark..."
echo " - Warmup: 3"
echo " - Runs: 50"
echo " - Cold Start Strategy: drop_caches before each run"

# 3. Hyperfine Ausführung

hyperfine \
  --warmup 3 \
  --runs 50 \
  --prepare "$PREPARE_CMD" \
  --export-csv "$OUTPUT_CSV" \
  --export-markdown "$OUTPUT_MD" \
  "sudo ctr run --rm --runtime=$RUNTIME_LINUX $IMG_LINUX bench-linux-runc /nbody  > /dev/null" \
  "sudo ctr run --rm --runc-binary crun --runtime=$RUNTIME_LINUX $IMG_LINUX bench-linux-crun /nbody  > /dev/null" \
  "sudo ctr run --rm --runc-binary crun --label module.wasm.image/variant=compat-smart --runtime=$RUNTIME_LINUX $IMG_WASM bench-wasm-crun /nbody.wasm  > /dev/null" \
  "sudo ctr run --rm --runtime=$RUNTIME_WASM $IMG_WASM bench-wasm-runwasi /nbody.wasm  > /dev/null" \
  "sudo ctr run --rm --runtime=$RUNTIME_SPIN $IMG_SPIN bench-spin /nbody.wasm  > /dev/null"

# 4. Ergebnisse anzeigen
echo ""
echo "Benchmark finished. Results saved to $OUTPUT_CSV"
cat "$OUTPUT_MD"