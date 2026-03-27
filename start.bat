@echo off
echo --- Verificando Configuracion del Proyecto ---

:: 1. Configuracion del Backend
echo Configurando Backend...
cd backend
if not exist venv (
    echo Creando entorno virtual...
    python -m venv venv
)

call venv\Scripts\activate
echo Instalando dependencias de Python...
pip install -r requirements.txt

echo Iniciando Backend en puerto 8000...
start /b uvicorn main:app --reload --port 8000
cd ..

:: 2. Configuracion del Frontend
echo Configurando Frontend...
cd frontend
if not exist node_modules (
    echo Instalando dependencias de NPM...
    npm install
)

echo Iniciando Frontend...
start /b npm run dev
cd ..

echo --- Todo listo. Los servidores estan corriendo ---
pause