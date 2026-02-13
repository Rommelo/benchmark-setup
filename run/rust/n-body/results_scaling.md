| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `CONCURRENCY=1 ./run_scaling.sh --worker io.containerd.runc.v2 docker.io/rommeloo/n-body-linux:v1 bench-linux-runc /nbody ""` | 750.8 ± 91.9 | 679.3 | 950.9 | 1.06 ± 0.15 |
| `CONCURRENCY=1 ./run_scaling.sh --worker io.containerd.runc.v2 docker.io/rommeloo/n-body-linux:v1 bench-linux-crun /nbody "--runc-binary crun"` | 706.2 ± 54.1 | 656.9 | 802.9 | 1.00 |
| `CONCURRENCY=1 ./run_scaling.sh --worker io.containerd.runc.v2 docker.io/rommeloo/n-body-runwasi:v1 bench-wasm-crun /nbody.wasm "--runc-binary crun --label module.wasm.image/variant=compat-smart"` | 708.3 ± 62.2 | 678.9 | 881.2 | 1.00 ± 0.12 |
| `CONCURRENCY=1 ./run_scaling.sh --worker io.containerd.wasmtime.v1 docker.io/rommeloo/n-body-runwasi:v1 bench-wasm-runwasi /nbody.wasm ""` | 954.3 ± 72.4 | 879.2 | 1092.1 | 1.35 ± 0.15 |
| `CONCURRENCY=1 ./run_scaling.sh --worker io.containerd.spin.v2 docker.io/rommeloo/n-body-spin:v1 bench-spin /nbody.wasm ""` | 924.1 ± 66.0 | 846.0 | 1034.8 | 1.31 ± 0.14 |
| `CONCURRENCY=20 ./run_scaling.sh --worker io.containerd.runc.v2 docker.io/rommeloo/n-body-linux:v1 bench-linux-runc /nbody ""` | 9903.1 ± 298.1 | 9526.1 | 10462.8 | 14.02 ± 1.15 |
| `CONCURRENCY=20 ./run_scaling.sh --worker io.containerd.runc.v2 docker.io/rommeloo/n-body-linux:v1 bench-linux-crun /nbody "--runc-binary crun"` | 10221.3 ± 658.5 | 9249.4 | 11352.9 | 14.47 ± 1.45 |
| `CONCURRENCY=20 ./run_scaling.sh --worker io.containerd.runc.v2 docker.io/rommeloo/n-body-runwasi:v1 bench-wasm-crun /nbody.wasm "--runc-binary crun --label module.wasm.image/variant=compat-smart"` | 10433.5 ± 302.7 | 9730.0 | 10879.3 | 14.77 ± 1.21 |
| `CONCURRENCY=20 ./run_scaling.sh --worker io.containerd.wasmtime.v1 docker.io/rommeloo/n-body-runwasi:v1 bench-wasm-runwasi /nbody.wasm ""` | 11063.1 ± 336.0 | 10485.1 | 11424.3 | 15.66 ± 1.29 |
| `CONCURRENCY=20 ./run_scaling.sh --worker io.containerd.spin.v2 docker.io/rommeloo/n-body-spin:v1 bench-spin /nbody.wasm ""` | 10295.9 ± 800.6 | 9323.1 | 11534.0 | 14.58 ± 1.59 |
| `CONCURRENCY=50 ./run_scaling.sh --worker io.containerd.runc.v2 docker.io/rommeloo/n-body-linux:v1 bench-linux-runc /nbody ""` | 25609.1 ± 570.4 | 24727.0 | 26306.3 | 36.26 ± 2.89 |
| `CONCURRENCY=50 ./run_scaling.sh --worker io.containerd.runc.v2 docker.io/rommeloo/n-body-linux:v1 bench-linux-crun /nbody "--runc-binary crun"` | 26286.6 ± 604.3 | 25658.8 | 27548.1 | 37.22 ± 2.98 |
| `CONCURRENCY=50 ./run_scaling.sh --worker io.containerd.runc.v2 docker.io/rommeloo/n-body-runwasi:v1 bench-wasm-crun /nbody.wasm "--runc-binary crun --label module.wasm.image/variant=compat-smart"` | 26812.6 ± 420.0 | 26229.6 | 27521.6 | 37.97 ± 2.97 |
| `CONCURRENCY=50 ./run_scaling.sh --worker io.containerd.wasmtime.v1 docker.io/rommeloo/n-body-runwasi:v1 bench-wasm-runwasi /nbody.wasm ""` | 31078.9 ± 784.9 | 29535.7 | 32600.3 | 44.01 ± 3.55 |
| `CONCURRENCY=50 ./run_scaling.sh --worker io.containerd.spin.v2 docker.io/rommeloo/n-body-spin:v1 bench-spin /nbody.wasm ""` | 26467.5 ± 1490.6 | 23820.3 | 28163.5 | 37.48 ± 3.56 |
