#!/bin/bash

set -e

IMG_LINUX="rommeloo/n-body-linux:v1"
IMG_WASM="rommeloo/n-body-runwasi:v1"

DOCKERFILE_LINUX="Dockerfile.linux"        
DOCKERFILE_WASM="Dockerfile.runwasi" 

# --- 1. LOGIN PRÜFEN ---
echo "--- Prüfe Docker Login ---"
if ! docker system info | grep -q "Username"; then
    echo "Du bist nicht eingeloggt. Bitte logge dich ein:"
    docker login
else
    echo "Bereits eingeloggt."
fi

# --- 2. LINUX IMAGE (Standard Build) ---
echo ""
echo "--- Baue und Pushe Linux Image: $IMG_LINUX ---"
docker build -f $DOCKERFILE_LINUX -t $IMG_LINUX .
docker push $IMG_LINUX
echo "✅ Linux Image erfolgreich gepusht."

# --- 3. WASM IMAGE (Buildx Build) ---
echo ""
echo "--- Baue und Pushe Wasm Image: $IMG_WASM ---"
docker buildx build \
  --platform wasi/wasm \
  --provenance=false \
  -f $DOCKERFILE_WASM \
  -t $IMG_WASM \
  --push \
  .

echo "✅ Wasm Image erfolgreich gepusht."

echo ""
echo "🎉 Fertig! Beide Images sind online."