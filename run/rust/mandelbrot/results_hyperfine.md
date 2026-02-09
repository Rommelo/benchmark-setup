| Command | Mean [s] | Min [s] | Max [s] | Relative |
|:---|---:|---:|---:|---:|
| `sudo ctr run --rm --runtime=io.containerd.runc.v2 docker.io/rommeloo/mandelbrot-linux:v1 bench-linux /mandelbrot  > /dev/null` | 3.876 ± 0.696 | 2.851 | 4.616 | 1.00 |
| `sudo ctr run --rm --runtime=io.containerd.wasmtime.v1 docker.io/rommeloo/mandelbrot-runwasi:v1 bench-wasm /mandelbrot.wasm  > /dev/null` | 4.201 ± 0.323 | 3.903 | 4.730 | 1.08 ± 0.21 |
| `sudo ctr run --rm --runtime=io.containerd.spin.v2 docker.io/rommeloo/mandelbrot-spin:v1 bench-spin /mandelbrot.wasm  > /dev/null` | 5.190 ± 0.809 | 3.871 | 6.087 | 1.34 ± 0.32 |
