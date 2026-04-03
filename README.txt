🌀 Monitor de Aforo Inteligente (YOLOv8 + React + FastAPI)
Sistema de visión artificial para el conteo de personas en tiempo real. Utiliza un backend de alto rendimiento con FastAPI y YOLOv8, conectado a un frontend moderno con React (Vite) y Tailwind CSS v4.

🛠️ Requisitos del Sistema
Recurso	Windows	
Lenguaje	Python 3.9+
Entorno Node	Node.js 18+ & npm
Cámara	Webcam / iVCam / Camo
Terminal	PowerShell o CMD

Recurso macOS
LenguajePython 3.9+
entorno Node	Node.js 18+ & npm
cámara	FaceTime / iPhone (Continuity)
Terminal    Zsh o Bash


📥 Instalación Paso a Paso (Terminal)
1. Preparación del Backend
Independientemente del SO, ejecuta estos comandos para configurar el cerebro del sistema:

Bash
cd backend
python -m venv venv

# ACTIVACIÓN DEL ENTORNO:
# En macOS/Linux:
source venv/bin/activate
# En Windows:
.\venv\Scripts\activate

# Instalación de dependencias:
pip install fastapi uvicorn opencv-python ultralytics python-multipart
pip freeze > requirements.txt
2. Preparación del Frontend
Configura la interfaz de usuario:

Bash
cd ../frontend
npm install
npm install -D @tailwindcss/postcss tailwindcss-animate postcss autoprefixer
🚀 Ejecución Automática
He creado scripts específicos para cada plataforma que automatizan la verificación de dependencias y el inicio de servidores.

En macOS (Archivo start.sh)
Asegúrate de tener el archivo start.sh en la raíz.

Dale permisos y ejecútalo:

Bash
chmod +x start.sh
./start.sh
En Windows (Archivo start.bat)
Crea un archivo llamado start.bat en la raíz con el código proporcionado anteriormente.

Ejecútalo haciendo doble clic o desde la terminal:

DOS
start.bat
📸 Configuración de Cámaras
Uso de iPhone (Cámara de Continuidad)
macOS: El sistema detectará automáticamente el iPhone si está en la misma red iCloud. El backend probará los índices 1 y 2.

Windows: Debes instalar una App como iVCam o Camo. Una vez instalada, el backend reconocerá al iPhone como una Webcam estándar en el índice 1.

Solución de problemas (Índice de Cámara)
Si el video no carga, edita backend/main.py:

cv2.VideoCapture(0) -> Cámara integrada.

cv2.VideoCapture(1) -> Primera cámara externa / iPhone.

🌐 Puntos de Acceso
Una vez iniciado el sistema, puedes monitorear todo en:

Panel de Control (App): http://localhost:5173

Stream de Datos: http://localhost:3000/video_feed

Estado del Backend: http://localhost:3000/health

⚠️ Notas Técnicas Importantes
CORS: El backend está configurado para aceptar peticiones de cualquier origen (allow_origins=["*"]), lo que facilita las pruebas en red local.

YOLOv8: La primera vez que inicies el sistema, se descargará automáticamente el archivo yolov8n.pt (aprox. 6MB).

Windows Firewall: Si Windows te pregunta, permite el acceso a las redes privadas para que el Frontend pueda "hablar" con el Backend.
