export default function App() {
  return (
    <div className="flex flex-col items-center justify-center min-h-screen bg-background p-4">
      <div className="w-full max-w-4xl space-y-6 text-center">
        <h1 className="text-4xl font-extrabold tracking-tight lg:text-5xl">
          Monitor de Aforo
        </h1>
        <p className="text-muted-foreground text-lg">
          Transmisión en tiempo real usando YOLOv8
        </p>
        
        <div className="relative mx-auto aspect-video w-full overflow-hidden rounded-xl border bg-muted shadow-lg">
          <img 
            src="http://localhost:8000/video_feed" 
            alt="Video Feed Cámara" 
            className="h-full w-full object-cover"
          />
        </div>
      </div>
    </div>
  )
}