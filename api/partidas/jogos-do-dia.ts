import type { VercelRequest, VercelResponse } from '@vercel/node';

type TimeInfo = { id: string; nome: string; logo: string; gols: number | null };
type Jogo = {
  id: string;
  local: string;
  hora: string;
  mandante: TimeInfo;
  visitante: TimeInfo;
};

export default function handler(_req: VercelRequest, res: VercelResponse) {
  res.setHeader('Content-Type', 'application/json; charset=utf-8');
  res.setHeader('Cache-Control', 'public, max-age=0, s-maxage=60, stale-while-revalidate=300');

  const hoje = new Date().toISOString().slice(0, 10);
  const jogos: Jogo[] = [
    {
      id: '1',
      local: 'Arena Fut7',
      hora: '19:30',
      mandante: { id: 't1', nome: 'Time A', logo: '/logos/a.png', gols: null },
      visitante: { id: 't2', nome: 'Time B', logo: '/logos/b.png', gols: null },
    },
    {
      id: '2',
      local: 'Arena Fut7',
      hora: '20:10',
      mandante: { id: 't3', nome: 'Time C', logo: '/logos/c.png', gols: null },
      visitante: { id: 't4', nome: 'Time D', logo: '/logos/d.png', gols: null },
    },
    {
      id: '3',
      local: 'Arena Fut7',
      hora: '20:50',
      mandante: { id: 't5', nome: 'Time E', logo: '/logos/e.png', gols: null },
      visitante: { id: 't6', nome: 'Time F', logo: '/logos/f.png', gols: null },
    },
  ];

  res.status(200).json({ date: hoje, jogos });
}
