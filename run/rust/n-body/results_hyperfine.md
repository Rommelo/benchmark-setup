| Command | Mean [s] | Min [s] | Max [s] | Relative |
|:---|---:|---:|---:|---:|
| `sudo ctr run --rm --runtime=io.containerd.runc.v2 docker.io/rommeloo/n-body-linux:v1 bench-linux /nbody  > /dev/null` | 3.294 ± 1.054 | 2.337 | 4.514 | 1.00 |
| `sudo ctr run --rm --runtime=io.containerd.wasmtime.v1 docker.io/rommeloo/n-body-runwasi:v1 bench-wasm /nbody.wasm  > /dev/null` | 3.473 ± 0.821 | 2.749 | 4.399 | 1.05 ± 0.42 |
| `sudo ctr run --rm --runtime=io.containerd.spin.v2 docker.io/rommeloo/n-body-spin:v1 bench-spin /nbody.wasm  > /dev/null` | 4.913 ± 1.673 | 3.058 | 6.935 | 1.49 ± 0.70 |
