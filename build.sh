#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────
#  build.sh  —  Gera binário MadTrade (Linux / macOS)
#  Requisito: Python 3.10+
# ─────────────────────────────────────────────────────────────
set -e

echo "[1/3] Criando ambiente virtual..."
python3 -m venv .venv
source .venv/bin/activate

echo "[2/3] Instalando dependências..."
pip install --upgrade pip --quiet
pip install -r requirements.txt --quiet

echo "[3/3] Compilando executável..."
pyinstaller MadTrade.spec --clean --noconfirm

deactivate

if [ -f "dist/MadTrade" ]; then
    chmod +x dist/MadTrade
    echo ""
    echo " Sucesso! Executável gerado em: dist/MadTrade"
else
    echo " ERRO: executável não encontrado. Veja o log acima."
    exit 1
fi
