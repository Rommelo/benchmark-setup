| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `CONCURRENCY=1 ./run_scaling.sh --worker io.containerd.runc.v2 docker.io/rommeloo/mandelbrot-linux:v1 bench-linux-runc /mandelbrot ""` | 766.4 ± 94.3 | 700.0 | 968.9 | 1.07 ± 0.17 |
| `CONCURRENCY=1 ./run_scaling.sh --worker io.containerd.runc.v2 docker.io/rommeloo/mandelbrot-linux:v1 bench-linux-crun /mandelbrot "--runc-binary crun"` | 713.0 ± 71.5 | 623.5 | 853.3 | 1.00 |
| `CONCURRENCY=1 ./run_scaling.sh --worker io.containerd.runc.v2 docker.io/rommeloo/mandelbrot-runwasi:v1 bench-wasm-crun /mandelbrot.wasm "--runc-binary crun --label module.wasm.image/variant=compat-smart"` | 753.1 ± 40.4 | 685.5 | 811.9 | 1.06 ± 0.12 |
| `CONCURRENCY=1 ./run_scaling.sh --worker io.containerd.wasmtime.v1 docker.io/rommeloo/mandelbrot-runwasi:v1 bench-wasm-runwasi /mandelbrot.wasm ""` | 955.0 ± 54.0 | 868.4 | 1023.0 | 1.34 ± 0.15 |
| `CONCURRENCY=1 ./run_scaling.sh --worker io.containerd.spin.v2 docker.io/rommeloo/mandelbrot-spin:v1 bench-spin /mandelbrot.wasm ""` | 908.2 ± 89.9 | 814.8 | 1047.0 | 1.27 ± 0.18 |
| `CONCURRENCY=20 ./run_scaling.sh --worker io.containerd.runc.v2 docker.io/rommeloo/mandelbrot-linux:v1 bench-linux-runc /mandelbrot ""` | 10661.6 ± 210.6 | 10424.5 | 11102.5 | 14.95 ± 1.53 |
| `CONCURRENCY=20 ./run_scaling.sh --worker io.containerd.runc.v2 docker.io/rommeloo/mandelbrot-linux:v1 bench-linux-crun /mandelbrot "--runc-binary crun"` | 11032.5 ± 244.1 | 10714.8 | 11559.2 | 15.47 ± 1.59 |
| `CONCURRENCY=20 ./run_scaling.sh --worker io.containerd.runc.v2 docker.io/rommeloo/mandelbrot-runwasi:v1 bench-wasm-crun /mandelbrot.wasm "--runc-binary crun --label module.wasm.image/variant=compat-smart"` | 11683.4 ± 526.2 | 10847.0 | 12455.1 | 16.39 ± 1.80 |
| `CONCURRENCY=20 ./run_scaling.sh --worker io.containerd.wasmtime.v1 docker.io/rommeloo/mandelbrot-runwasi:v1 bench-wasm-runwasi /mandelbrot.wasm ""` | 12264.0 ± 643.2 | 11134.8 | 13276.2 | 17.20 ± 1.95 |
| `CONCURRENCY=20 ./run_scaling.sh --worker io.containerd.spin.v2 docker.io/rommeloo/mandelbrot-spin:v1 bench-spin /mandelbrot.wasm ""` | 11066.0 ± 649.0 | 9957.2 | 12292.7 | 15.52 ± 1.80 |
| `CONCURRENCY=50 ./run_scaling.sh --worker io.containerd.runc.v2 docker.io/rommeloo/mandelbrot-linux:v1 bench-linux-runc /mandelbrot ""` | 27595.2 ± 524.3 | 26525.4 | 28109.9 | 38.70 ± 3.95 |
| `CONCURRENCY=50 ./run_scaling.sh --worker io.containerd.runc.v2 docker.io/rommeloo/mandelbrot-linux:v1 bench-linux-crun /mandelbrot "--runc-binary crun"` | 27916.2 ± 758.8 | 26547.3 | 29015.4 | 39.15 ± 4.07 |
| `CONCURRENCY=50 ./run_scaling.sh --worker io.containerd.runc.v2 docker.io/rommeloo/mandelbrot-runwasi:v1 bench-wasm-crun /mandelbrot.wasm "--runc-binary crun --label module.wasm.image/variant=compat-smart"` | 28497.7 ± 723.4 | 27339.6 | 29821.9 | 39.97 ± 4.13 |
| `CONCURRENCY=50 ./run_scaling.sh --worker io.containerd.wasmtime.v1 docker.io/rommeloo/mandelbrot-runwasi:v1 bench-wasm-runwasi /mandelbrot.wasm ""` | 32474.1 ± 1425.7 | 30528.6 | 34548.2 | 45.54 ± 4.98 |
| `CONCURRENCY=50 ./run_scaling.sh --worker io.containerd.spin.v2 docker.io/rommeloo/mandelbrot-spin:v1 bench-spin /mandelbrot.wasm ""` | 26788.1 ± 1066.0 | 25122.4 | 28750.6 | 37.57 ± 4.05 |
