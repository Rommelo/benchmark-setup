| Command | Mean [s] | Min [s] | Max [s] | Relative |
|:---|---:|---:|---:|---:|
| `sudo ctr run --rm --runtime=io.containerd.runc.v2 docker.io/rommeloo/n-body-linux:v1 bench-linux-runc /nbody  > /dev/null` | 2.532 ± 0.159 | 2.241 | 2.905 | 1.09 ± 0.09 |
| `sudo ctr run --rm --runc-binary crun --runtime=io.containerd.runc.v2 docker.io/rommeloo/n-body-linux:v1 bench-linux-crun /nbody  > /dev/null` | 2.353 ± 0.158 | 2.083 | 2.835 | 1.02 ± 0.09 |
| `sudo ctr run --rm --runc-binary crun --label module.wasm.image/variant=compat-smart --runtime=io.containerd.runc.v2 docker.io/rommeloo/n-body-runwasi:v1 bench-wasm-crun /nbody.wasm  > /dev/null` | 2.317 ± 0.133 | 2.044 | 2.557 | 1.00 |
| `sudo ctr run --rm --runtime=io.containerd.wasmtime.v1 docker.io/rommeloo/n-body-runwasi:v1 bench-wasm-runwasi /nbody.wasm  > /dev/null` | 2.538 ± 0.150 | 2.294 | 2.858 | 1.10 ± 0.09 |
| `sudo ctr run --rm --runtime=io.containerd.spin.v2 docker.io/rommeloo/n-body-spin:v1 bench-spin /nbody.wasm  > /dev/null` | 3.020 ± 0.177 | 2.627 | 3.278 | 1.30 ± 0.11 |
