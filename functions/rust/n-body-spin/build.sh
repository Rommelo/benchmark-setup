#!/bin/bash

# Das Skript bricht sofort ab, wenn ein Fehler passiert
set -e

# --- KONFIGURATION ---
IMG_SPIN="rommeloo/n-body-spin:v1"

echo "=========================================="
echo "🚀 Starte Build & Push für Spin App"
echo "Ziel: $IMG_SPIN"
echo "=========================================="

# --- 1. BUILD ---
echo ""
echo "--- [1/2] Baue Spin App ---"
spin build

if [ $? -eq 0 ]; then
    echo "✅ Build erfolgreich."
else
    echo "❌ Build fehlgeschlagen."
    exit 1
fi

# --- 2. PUSH ---
echo ""
echo "--- [2/2] Pushe zu Registry ---"
spin registry push $IMG_SPIN

echo ""
echo "🎉 Fertig! Deine Spin App ist jetzt online unter:"
echo "$IMG_SPIN"