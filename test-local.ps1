# Script para testar localmente a API
Write-Host "== Testando API localmente ==" -ForegroundColor Cyan

Write-Host "`n1. Iniciando servidor local..." -ForegroundColor Yellow
Write-Host "Execute: npm run dev" -ForegroundColor Green
Write-Host "Aguarde o servidor iniciar em http://localhost:3001" -ForegroundColor Green

Write-Host "`n2. Testando endpoints:" -ForegroundColor Yellow
Write-Host "curl http://localhost:3001/health" -ForegroundColor Green
Write-Host "curl http://localhost:3001/partidas/jogos-do-dia" -ForegroundColor Green

Write-Host "`n3. Para testar na Vercel:" -ForegroundColor Yellow
Write-Host "curl https://api.fut7pro.com.br/health" -ForegroundColor Green
Write-Host "curl https://api.fut7pro.com.br/partidas/jogos-do-dia" -ForegroundColor Green
