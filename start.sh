#!/bin/bash

# Función para limpiar procesos al salir
cleanup() {
    echo -e "\n\033[0;31mCerrando servidores...\033[0m"
    kill $BACKEND_PID $FRONTEND_PID 2>/dev/null
    exit
}

trap cleanup SIGINT

echo -e "\033[0;34m--- Verificando Configuración del Proyecto ---\033[0m"

# 1. Configuración del Backend
echo "Configurando Backend..."
cd backend
if [ ! -d "venv" ]; then
    echo "Creando entorno virtual..."
    python3 -m venv venv
fi

source venv/bin/activate
echo "Instalando/Actualizando dependencias de Python..."
pip install --upgrade pip
pip install -r requirements.txt

echo "Iniciando Backend en puerto 8000..."
uvicorn main:app --reload --port 8000 &
BACKEND_PID=$!
cd ..

# 2. Configuración del Frontend
echo "Configurando Frontend..."
cd frontend
if [ ! -d "node_modules" ]; then
    echo "Carpeta node_modules no encontrada. Instalando dependencias de NPM..."
    npm install
else
    # Opcional: sincronizar si hay cambios en package.json
    npm install
fi

echo "Iniciando Frontend..."
npm run dev &
FRONTEND_PID=$!
cd ..

echo -e "\033[0;32m--- Todo listo. Presiona Ctrl+C para detener ambos servicios ---\033[0m"
wait