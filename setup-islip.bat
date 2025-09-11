@echo off
echo === Setting up offline ISLP environment ===

REM 1. Create venv if missing
if not exist .venv (
    echo Creating virtual environment...
    py -3.11 -m venv .venv
) else (
    echo .venv already exists, skipping creation.
)

REM 2. Upgrade pip
.\.venv\Scripts\python.exe -m pip install --upgrade pip

REM 3. Install from local wheels
if not exist wheels (
    echo ERROR: wheels folder not found!
    pause
    exit /b
)
if not exist requirements.txt (
    echo ERROR: requirements.txt not found!
    pause
    exit /b
)
.\.venv\Scripts\python.exe -m pip install --no-index --find-links wheels -r requirements.txt

REM 4. Register Jupyter kernel
.\.venv\Scripts\python.exe -m ipykernel install --user --name=islp-env --display-name "Python (ISLP)"

echo === Setup complete! Select "Python (ISLP)" in VS Code. ===
pause
