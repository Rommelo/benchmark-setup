WebAssembly als Container-Alternative

Eine vergleichende Analyse von Performance in Serverless-Container-Umgebungen

Dieses Repository dient der Dokumentation und Reproduzierbarkeit der Ergebnisse meiner Hausarbeit. Es enthält den Versuchsaufbau sowie alle notwendigen Skripte, um die Performance-Vergleiche zwischen klassischen Containern und WebAssembly-basierten Lösungen durchzuführen.

📋 Voraussetzungen

Um die Umgebung aufzusetzen und die Benchmarks auszuführen, müssen folgende Werkzeuge und Runtimes auf dem Testsystem installiert sein:

containerd

ctr (Command line client for containerd)

hyperfine (Benchmarking Tool)

spin shim

crun (konfiguriert mit wasmtime oder wasmedge)

runwasi

🛠 Installation & Referenzen

Für die Installation der spezifischen WebAssembly-Runtimes und Shims folgen Sie bitte den untenstehenden Quellen:

Komponente

Link / Tutorial

crun

Tutorial: wasm-serverless-benchmarks

Spin Shim

GitHub: containerd-shim-spin

runwasi

GitHub: containerd/runwasi

🚀 Nutzung & Reproduktion

Es gibt zwei Möglichkeiten, die für die Tests benötigten Images bereitzustellen:

Option A: Eigene Images bauen

Sie können die Images auf Ihrem eigenen System bauen. Stellen Sie sicher, dass diese anschließend korrekt in containerd importiert und in den Benchmark-Skripten referenziert werden.

Option B: Öffentliche Images nutzen (DockerHub)

Alternativ können Sie die vorkonfigurierten Images direkt von DockerHub pullen. Dies ist der empfohlene Weg, um die exakten Versionen aus der Hausarbeit zu testen.

# Beispielbefehl zum Pullen (Bitte Image-Namen anpassen)
sudo ctr images pull docker.io/USERNAME/IMAGE:TAG


📂 Repository Struktur

/functions - Quellcode und Build Skripte für die Images.

/run - Skripte und Ergebnisse für die Ausführung.
