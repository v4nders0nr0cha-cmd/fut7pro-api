# 🚀 Fut7Pro API - Deploy na Vercel

## 📋 Checklist Completo

### ✅ 1. Preparar Repositório GitHub
- [ ] Criar repositório `fut7pro-api` no GitHub
- [ ] Fazer upload de todos os arquivos do projeto
- [ ] Fazer commit inicial

### ✅ 2. Deploy na Vercel
- [ ] Acessar [vercel.com](https://vercel.com)
- [ ] Fazer login com GitHub
- [ ] Clicar em "Add New Project"
- [ ] Importar o repositório `fut7pro-api`
- [ ] **NÃO** configurar build command (deixar vazio)
- [ ] Runtime: Node.js 20.x (padrão)
- [ ] Fazer deploy

### ✅ 3. Configurar Domínio Customizado
- [ ] Na Vercel: Project → Settings → Domains
- [ ] Clicar em "Add Domain"
- [ ] Digitar: `api.fut7pro.com.br`
- [ ] Anotar o CNAME alvo (ex: `cname.vercel-dns.com`)

### ✅ 4. Atualizar DNS no GoDaddy
- [ ] Acessar painel do GoDaddy
- [ ] Ir em DNS Management
- [ ] **Editar** o registro CNAME `api`
- [ ] Alterar de `3xyp28ms.up.railway.app` para o CNAME da Vercel
- [ ] Salvar alterações

### ✅ 5. Remover Domínio do Railway
- [ ] Acessar Railway Dashboard
- [ ] Ir no projeto backend
- [ ] Settings → Custom Domain
- [ ] **Remover** `api.fut7pro.com.br`
- [ ] Confirmar remoção

### ✅ 6. Aguardar Propagação DNS
- [ ] Aguardar 5-15 minutos
- [ ] Verificar se o domínio está "Configured" na Vercel

### ✅ 7. Testar API
```powershell
# Teste básico
curl -sI https://api.fut7pro.com.br/health
curl -s https://api.fut7pro.com.br/health

# Teste com cache
curl -sI https://api.fut7pro.com.br/partidas/jogos-do-dia
curl -s https://api.fut7pro.com.br/partidas/jogos-do-dia
```

### ✅ 8. Atualizar Frontend (Vercel)
- [ ] Acessar projeto do frontend na Vercel
- [ ] Ir em Settings → Environment Variables
- [ ] Atualizar `BACKEND_URL` para `https://api.fut7pro.com.br`
- [ ] Remover ou esvaziar `NEXT_PUBLIC_USE_JOGOS_MOCK`
- [ ] Fazer redeploy do frontend

### ✅ 9. Testar Frontend
```powershell
# Teste do proxy do frontend
curl -sI https://app.fut7pro.com.br/api/public/jogos-do-dia
curl -s https://app.fut7pro.com.br/api/public/jogos-do-dia
```

## 🔧 Estrutura do Projeto

```
fut7pro-api/
├── api/
│   ├── health.ts                    # Endpoint /health
│   └── partidas/
│       └── jogos-do-dia.ts         # Endpoint /partidas/jogos-do-dia
├── vercel.json                      # Configuração de rotas
├── package.json                     # Dependências
├── tsconfig.json                    # Configuração TypeScript
├── .gitignore                       # Arquivos ignorados
├── test-local.ps1                   # Script de teste local
├── README_DEPLOY_API_VERCEL.md      # Instruções de deploy
└── INSTRUCOES_COMPLETAS.md          # Este arquivo
```

## 🎯 Endpoints Disponíveis

### GET /health
- **Resposta:** `{ "status": "ok", "ts": "2025-01-15T00:21:47.000Z" }`
- **Cache:** `no-store`

### GET /partidas/jogos-do-dia
- **Resposta:** Lista de jogos do dia
- **Cache:** `public, max-age=0, s-maxage=60, stale-while-revalidate=300`

## 🚨 Troubleshooting

### Problema: Domínio não resolve
- Verificar se o CNAME está correto no GoDaddy
- Aguardar propagação DNS (até 24h)
- Testar com `nslookup api.fut7pro.com.br`

### Problema: Erro 404
- Verificar se o domínio está "Configured" na Vercel
- Verificar se as rotas estão corretas no `vercel.json`

### Problema: Erro de certificado
- Aguardar a Vercel gerar o certificado SSL
- Pode levar alguns minutos após a configuração

## 📞 Suporte

Se encontrar problemas:
1. Verificar logs na Vercel (Functions → Logs)
2. Testar endpoints individualmente
3. Verificar configuração DNS no GoDaddy
4. Aguardar propagação completa (até 24h)
