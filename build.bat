@echo off
REM ─────────────────────────────────────────────────────────────
REM  build.bat  —  Gera MadTrade.exe (Windows)
REM  Requisito: Python 3.10+ no PATH
REM ─────────────────────────────────────────────────────────────

echo [1/3] Criando ambiente virtual...
python -m venv .venv
call .venv\Scripts\activate.bat

echo [2/3] Instalando dependencias...
pip install -r requirements.txt --quiet

echo [3/3] Compilando executavel...
pyinstaller MadTrade.spec --clean --noconfirm

echo.
if exist dist\MadTrade.exe (
    echo  Sucesso! Executavel gerado em: dist\MadTrade.exe
) else (
    echo  ERRO: executavel nao encontrado. Veja o log acima.
    exit /b 1
)

call .venv\Scripts\deactivate.bat
pause
