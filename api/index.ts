import type { VercelRequest, VercelResponse } from '@vercel/node';

export default function handler(_req: VercelRequest, res: VercelResponse) {
  res.setHeader('Cache-Control', 'no-store');
  res.status(200).json({ 
    name: "Fut7Pro API", 
    ok: true, 
    ts: new Date().toISOString(),
    endpoints: {
      health: "/health",
      jogos: "/partidas/jogos-do-dia"
    }
  });
}
