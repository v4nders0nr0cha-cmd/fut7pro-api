# Fut7Pro API (Vercel)

## 1) Criar o projeto
- No GitHub, crie o repositório `fut7pro-api` com estes arquivos.
- Na Vercel, `Add New Project` → importe o repo.
- Não precisa de build command. Runtime: Node.js 20 (default).

## 2) Domínio `api.fut7pro.com.br`
- Vercel → Project → Settings → Domains → Add Domain → `api.fut7pro.com.br`.
- A Vercel vai mostrar um CNAME alvo tipo `xxxx.vercel-dns.com` (ou `cname.vercel-dns.com`).
- No GoDaddy, edite o **CNAME `api`** para esse alvo da Vercel.
- **Remova** `api.fut7pro.com.br` do Railway (para não "prender" o domínio lá).
- Aguarde a verificação ficar **Configured**.

## 3) Testes
```powershell
curl -sI https://api.fut7pro.com.br/health | findstr /I "HTTP Cache-Control"
curl -s  https://api.fut7pro.com.br/health

curl -sI https://api.fut7pro.com.br/partidas/jogos-do-dia | findstr /I "HTTP Cache-Control"
curl -s  https://api.fut7pro.com.br/partidas/jogos-do-dia
```

## 4) App (frontend)
- BACKEND_URL=https://api.fut7pro.com.br
- Remover/esvaziar NEXT_PUBLIC_USE_JOGOS_MOCK.

Validar o proxy:
```powershell
curl -sI https://app.fut7pro.com.br/api/public/jogos-do-dia | findstr /I "HTTP X-Vercel-Cache x-fallback-source Cache-Control"
curl -s  https://app.fut7pro.com.br/api/public/jogos-do-dia
```

Esperado: X-Vercel-Cache: HIT|STALE e sem x-fallback-source=mock|static.

---

## Por que essa solução agora?
- Você não consegue deployar serviços no Railway no plano atual.  
- Na Vercel, **serverless** é perfeito para nossos endpoints públicos, com TLS automático e domínio custom.  
- Mantemos `api.fut7pro.com.br` (só muda o provedor), sem alterar o frontend.

---

## Se preferir ficar no Railway depois
Quando/Se fizer upgrade do Railway:
1) Remova `api.fut7pro.com.br` da Vercel,  
2) Recrie o custom domain no Railway,  
3) Volte o CNAME `api` no GoDaddy para o token `*.up.railway.app`,  
4) Faça deploy do NestJS e revalide `/health` e `/partidas/jogos-do-dia`.
