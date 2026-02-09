| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `CONCURRENCY=1 ./run_scaling.sh --worker io.containerd.runc.v2 docker.io/rommeloo/n-body-linux:v1 bench-linux /nbody` | 824.0 ± 104.0 | 696.0 | 1036.0 | 1.00 |
| `CONCURRENCY=1 ./run_scaling.sh --worker io.containerd.wasmtime.v1 docker.io/rommeloo/n-body-runwasi:v1 bench-wasm /nbody.wasm` | 986.9 ± 72.3 | 907.6 | 1104.8 | 1.20 ± 0.17 |
| `CONCURRENCY=1 ./run_scaling.sh --worker io.containerd.spin.v2 docker.io/rommeloo/n-body-spin:v1 bench-spin /nbody.wasm` | 1053.3 ± 181.8 | 893.9 | 1445.6 | 1.28 ± 0.27 |
| `CONCURRENCY=10 ./run_scaling.sh --worker io.containerd.runc.v2 docker.io/rommeloo/n-body-linux:v1 bench-linux /nbody` | 5588.4 ± 352.4 | 5030.5 | 6122.5 | 6.78 ± 0.96 |
| `CONCURRENCY=10 ./run_scaling.sh --worker io.containerd.wasmtime.v1 docker.io/rommeloo/n-body-runwasi:v1 bench-wasm /nbody.wasm` | 6133.4 ± 385.0 | 5550.9 | 6736.7 | 7.44 ± 1.05 |
| `CONCURRENCY=10 ./run_scaling.sh --worker io.containerd.spin.v2 docker.io/rommeloo/n-body-spin:v1 bench-spin /nbody.wasm` | 6341.4 ± 345.5 | 5898.9 | 6891.7 | 7.70 ± 1.06 |
| `CONCURRENCY=20 ./run_scaling.sh --worker io.containerd.runc.v2 docker.io/rommeloo/n-body-linux:v1 bench-linux /nbody` | 12517.9 ± 636.1 | 11638.8 | 13614.2 | 15.19 ± 2.07 |
| `CONCURRENCY=20 ./run_scaling.sh --worker io.containerd.wasmtime.v1 docker.io/rommeloo/n-body-runwasi:v1 bench-wasm /nbody.wasm` | 13355.7 ± 493.8 | 12533.2 | 14023.1 | 16.21 ± 2.13 |
| `CONCURRENCY=20 ./run_scaling.sh --worker io.containerd.spin.v2 docker.io/rommeloo/n-body-spin:v1 bench-spin /nbody.wasm` | 12363.0 ± 819.0 | 11106.6 | 13625.0 | 15.00 ± 2.14 |
