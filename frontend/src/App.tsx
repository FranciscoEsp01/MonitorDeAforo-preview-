import { CounterDashboard } from "./features/people-counter/CounterDashboard";

export default function App() {
  return (
    <main className="min-h-screen w-full flex flex-col items-center justify-center bg-zinc-50 dark:bg-zinc-950 p-4 lg:p-8">
      <div className="w-full max-w-6xl mb-8">
        <h1 className="text-3xl font-bold tracking-tight">Panel de Control</h1>
        <p className="text-muted-foreground">Monitoreo de aforo por zonas</p>
      </div>
      <CounterDashboard />
    </main>
  );
}