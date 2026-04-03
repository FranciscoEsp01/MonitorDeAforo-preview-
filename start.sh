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

# El frontend espera que el backend esté en el puerto 3000
echo "Iniciando Backend en puerto 3000..."
uvicorn main:app --reload --port 3000 &
BACKEND_PID=$!
cd ..

# 2. Configuración del Frontend
echo "Configurando Frontend..."
cd frontend
if [ ! -d "node_modules" ]; then
    echo "Carpeta node_modules no encontrada. Instalando dependencias de NPM..."
    npm install
else
    # Sincronizar si hay cambios en package.json
    npm install
fi

# Agregamos --force para evitar problemas de caché de Vite que tuviste antes
echo "Iniciando Frontend..."
npm run dev -- --force &
FRONTEND_PID=$!
cd ..

sleep 2 # Pausa de 2 segundos para dar tiempo a que las terminales impriman sus cosas

echo -e "\n\033[0;32m========================================================\033[0m"
echo -e "\033[0;32m🚀  TODO LISTO Y CONECTADO  🚀\033[0m"
echo -e "\033[0;32m========================================================\033[0m"
echo -e "🖥️  Frontend (Abre esto en tu navegador): \033[4;34mhttp://localhost:5173\033[0m"
echo -e "⚙️  Backend API: \033[4;34mhttp://localhost:3000\033[0m"
echo -e "========================================================"
echo -e "\033[0;33mPresiona Ctrl+C en cualquier momento para apagar todo.\033[0m\n"

wait