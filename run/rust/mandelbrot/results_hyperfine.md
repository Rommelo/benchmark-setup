| Command | Mean [s] | Min [s] | Max [s] | Relative |
|:---|---:|---:|---:|---:|
| `sudo ctr run --rm --runtime=io.containerd.runc.v2 docker.io/rommeloo/mandelbrot-linux:v1 bench-linux /mandelbrot  > /dev/null` | 2.700 ± 0.164 | 2.409 | 3.272 | 1.16 ± 0.09 |
| `sudo ctr run --rm --runc-binary crun --runtime=io.containerd.runc.v2 docker.io/rommeloo/mandelbrot-linux:v1 bench-linux-crun /mandelbrot  > /dev/null` | 2.470 ± 0.114 | 2.200 | 2.680 | 1.06 ± 0.07 |
| `sudo ctr run --rm --runc-binary crun --label module.wasm.image/variant=compat-smart --runtime=io.containerd.runc.v2 docker.io/rommeloo/mandelbrot-runwasi:v1 bench-wasm-crun /mandelbrot.wasm  > /dev/null` | 2.333 ± 0.101 | 1.990 | 2.508 | 1.00 |
| `sudo ctr run --rm --runtime=io.containerd.wasmtime.v1 docker.io/rommeloo/mandelbrot-runwasi:v1 bench-wasm-runwasi /mandelbrot.wasm  > /dev/null` | 2.770 ± 0.174 | 2.365 | 3.150 | 1.19 ± 0.09 |
| `sudo ctr run --rm --runtime=io.containerd.spin.v2 docker.io/rommeloo/mandelbrot-spin:v1 bench-spin /mandelbrot.wasm  > /dev/null` | 3.035 ± 0.175 | 2.641 | 3.535 | 1.30 ± 0.09 |
