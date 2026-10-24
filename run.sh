#!/bin/bash
# ==============================================================================
# OIL SIF Precursor Detection AI/NLP Platform - One-Click Launcher
# Problem Statement ID: 26165 | Oil India Limited
# ==============================================================================

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

echo "========================================================================"
echo " OIL INDIA LIMITED — AI/NLP SIF PRECURSOR DETECTION SYSTEM"
echo " Problem Statement ID: 26165 | HSE Decision Support Platform"
echo "========================================================================"

# Check Python3
if ! command -v python3 &> /dev/null; then
    echo "Error: python3 is not installed or not in PATH."
    exit 1
fi

# Set up virtual environment if needed
if [ ! -d "venv" ]; then
    echo "[+] Creating virtual environment 'venv'..."
    python3 -m venv venv
fi

if [ -f "venv/bin/activate" ]; then
    source venv/bin/activate
elif [ -f "venv/Scripts/activate" ]; then
    source venv/Scripts/activate
fi


echo "[+] Checking & installing required packages..."
pip install -q -r backend/requirements.txt

export PYTHONPATH="$DIR/backend"

echo ""
echo "[+] Starting server at http://localhost:8000 ..."
echo "[+] Interactive Dashboard: http://localhost:8000/"
echo "[+] Swagger API Docs:      http://localhost:8000/docs"
echo ""

python3 -m uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload --app-dir "$DIR/backend"
