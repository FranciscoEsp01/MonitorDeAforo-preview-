import { useCounter } from "./useCounter";

export function CounterDashboard() {
  const { data, loading, error } = useCounter(2000);

  if (loading) return <div>Cargando...</div>;
  if (error) return <div>Error: {error}</div>;

  return (
    <div className="p-8 text-2xl">
      Prueba de conexión: {data?.count} personas.
    </div>
  );
}