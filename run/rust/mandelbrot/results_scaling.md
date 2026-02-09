| Command | Mean [s] | Min [s] | Max [s] | Relative |
|:---|---:|---:|---:|---:|
| `CONCURRENCY=1 ./scaling-run.sh --worker io.containerd.runc.v2 docker.io/rommeloo/mandelbrot-linux:v1 bench-linux /mandelbrot` | 1.066 ± 0.082 | 0.985 | 1.252 | 1.00 |
| `CONCURRENCY=1 ./scaling-run.sh --worker io.containerd.wasmtime.v1 docker.io/rommeloo/mandelbrot-runwasi:v1 bench-wasm /mandelbrot.wasm` | 1.360 ± 0.126 | 1.230 | 1.609 | 1.28 ± 0.15 |
| `CONCURRENCY=1 ./scaling-run.sh --worker io.containerd.spin.v2 docker.io/rommeloo/mandelbrot-spin:v1 bench-spin /mandelbrot.wasm` | 1.307 ± 0.158 | 1.087 | 1.588 | 1.23 ± 0.18 |
| `CONCURRENCY=10 ./scaling-run.sh --worker io.containerd.runc.v2 docker.io/rommeloo/mandelbrot-linux:v1 bench-linux /mandelbrot` | 7.218 ± 0.253 | 6.944 | 7.636 | 6.77 ± 0.57 |
| `CONCURRENCY=10 ./scaling-run.sh --worker io.containerd.wasmtime.v1 docker.io/rommeloo/mandelbrot-runwasi:v1 bench-wasm /mandelbrot.wasm` | 8.031 ± 0.385 | 7.562 | 8.771 | 7.53 ± 0.68 |
| `CONCURRENCY=10 ./scaling-run.sh --worker io.containerd.spin.v2 docker.io/rommeloo/mandelbrot-spin:v1 bench-spin /mandelbrot.wasm` | 7.560 ± 0.566 | 6.846 | 8.486 | 7.09 ± 0.76 |
| `CONCURRENCY=20 ./scaling-run.sh --worker io.containerd.runc.v2 docker.io/rommeloo/mandelbrot-linux:v1 bench-linux /mandelbrot` | 14.956 ± 0.636 | 14.034 | 16.171 | 14.03 ± 1.24 |
| `CONCURRENCY=20 ./scaling-run.sh --worker io.containerd.wasmtime.v1 docker.io/rommeloo/mandelbrot-runwasi:v1 bench-wasm /mandelbrot.wasm` | 17.252 ± 0.318 | 16.779 | 17.631 | 16.18 ± 1.28 |
| `CONCURRENCY=20 ./scaling-run.sh --worker io.containerd.spin.v2 docker.io/rommeloo/mandelbrot-spin:v1 bench-spin /mandelbrot.wasm` | 14.686 ± 0.678 | 13.634 | 15.588 | 13.78 ± 1.24 |
