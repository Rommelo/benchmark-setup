#!/bin/bash

# --- 1. Konfiguration ---
# HINWEIS: CONCURRENCY wird später von Hyperfine überschrieben
: ${CONCURRENCY:=1} 
RUNS=10

REG_USER="rommeloo"
IMG_LINUX="docker.io/rommeloo/n-body-linux:v1"
RUNTIME_LINUX="io.containerd.runc.v2" 

IMG_WASM="docker.io/rommeloo/n-body-runwasi:v1"
RUNTIME_WASM="io.containerd.wasmtime.v1"

IMG_SPIN="docker.io/rommeloo/n-body-spin:v1"
RUNTIME_SPIN="io.containerd.spin.v2"

OUTPUT_CSV="results_scaling.csv"
OUTPUT_MD="results_scaling.md"

# --- 2. Die Worker-Funktion (Die eigentliche Arbeit) ---
run_batch() {
    local runtime=$1
    local image=$2
    local name_prefix=$3
    local cmd_arg=$4 
    
    # Wir lesen CONCURRENCY aus der Umgebung (gesetzt durch Hyperfine)
    local count=${CONCURRENCY:-1}

    for i in $(seq 1 $count); do
        # Startet N Container im Hintergrund
        sudo ctr run --rm --runtime=$runtime $image "$name_prefix-$i" $cmd_arg > /dev/null 2>&1 & 
    done

    # Warten auf alle Child-Prozesse dieses Batches
    wait
}

# --- 3. DISPATCHER: Prüfen, ob wir im Worker-Modus sind ---
if [ "$1" == "--worker" ]; then
    # Wenn das erste Argument "--worker" ist, führen wir die Funktion aus und beenden uns.
    shift # "--worker" entfernen
    run_batch "$@"
    exit 0
fi

# =========================================================
# Alles hierunter wird nur vom "Master"-Aufruf ausgeführt
# =========================================================

prepare_environment() {
    echo "[Setup] Cleaning up..."
    # Aufräumen (ignoriert Fehler falls nichts da ist)
    sudo ctr tasks ls -q | grep "bench-" | xargs -r sudo ctr tasks kill -s 9 > /dev/null 2>&1
    sudo ctr containers ls -q | grep "bench-" | xargs -r sudo ctr containers rm > /dev/null 2>&1
    
    # Cache Drop (optional, für Scaling Tests aber oft gut)
    #sync; echo 3 | sudo tee /proc/sys/vm/drop_caches > /dev/null
}

echo "Starting Scaling Benchmark..."
echo "Output: $OUTPUT_CSV"

# Cleanup Command für Hyperfine
PREPARE_CMD="sudo ctr tasks ls -q | grep bench | xargs -r sudo ctr tasks kill >/dev/null 2>&1; \
             sudo ctr containers ls -q | grep bench | xargs -r sudo ctr containers rm >/dev/null 2>&1;" #\
             #sync; echo 3 | sudo tee /proc/sys/vm/drop_caches > /dev/null"

# Wir rufen jetzt ./scaling-run.sh --worker auf, statt bash -c 'run_batch'
# Das Skript muss ausführbar sein (chmod +x scaling-run.sh)
SCRIPT_PATH="./$(basename "$0")"

hyperfine \
  --warmup 2 \
  --runs $RUNS \
  --prepare "$PREPARE_CMD" \
  --export-csv "$OUTPUT_CSV" \
  --export-markdown "$OUTPUT_MD" \
  --parameter-list threads 1,10,20 \
  "CONCURRENCY={threads} $SCRIPT_PATH --worker $RUNTIME_LINUX $IMG_LINUX bench-linux /nbody" \
  "CONCURRENCY={threads} $SCRIPT_PATH --worker $RUNTIME_WASM $IMG_WASM bench-wasm /nbody.wasm" \
  "CONCURRENCY={threads} $SCRIPT_PATH --worker $RUNTIME_SPIN $IMG_SPIN bench-spin /nbody.wasm"

echo ""
echo "Benchmark finished."
cat "$OUTPUT_MD"