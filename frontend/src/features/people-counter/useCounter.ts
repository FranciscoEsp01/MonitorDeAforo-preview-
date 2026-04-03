import { useState, useEffect } from 'react';

export const useCounter = (intervalMs = 2000) => {
  const [data, setData] = useState({ count: 0, location: "Cámara 1" });
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const loadData = async () => {
      try {
        const res = await fetch('http://localhost:3000/api/counter/current');
        if (!res.ok) throw new Error('Error de red');
        const result = await res.json();
        setData(result);
        setError(null);
      } catch (e) {
        setData(prev => ({ ...prev, count: Math.floor(Math.random() * 20) + 20 }));
        setError('Modo de prueba activo');
      } finally {
        setLoading(false);
      }
    };
    
    loadData();
    const interval = setInterval(loadData, intervalMs);
    return () => clearInterval(interval);
  }, [intervalMs]);

  return { data, loading, error };
};