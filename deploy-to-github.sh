#!/bin/bash

echo "🚀 Deploying Fut7Pro API to GitHub..."

# Verificar se estamos no diretório correto
if [ ! -f "package.json" ]; then
    echo "❌ Erro: package.json não encontrado. Execute este script na pasta fut7pro-api/"
    exit 1
fi

# Configurar git se necessário
if [ ! -d ".git" ]; then
    echo "📁 Inicializando repositório git..."
    git init
fi

# Adicionar todos os arquivos
echo "📦 Adicionando arquivos..."
git add .

# Fazer commit
echo "💾 Fazendo commit..."
git commit -m "Initial commit: Fut7Pro API for Vercel deployment"

# Verificar se já existe remote
if ! git remote get-url origin > /dev/null 2>&1; then
    echo "⚠️  Remote origin não configurado."
    echo "📝 Configure manualmente:"
    echo "   git remote add origin https://github.com/SEU_USUARIO/fut7pro-api.git"
    echo "   git branch -M main"
    echo "   git push -u origin main"
else
    echo "🔄 Fazendo push..."
    git branch -M main
    git push -u origin main
fi

echo "✅ Deploy concluído!"
echo ""
echo "📋 Próximos passos:"
echo "1. Acesse https://github.com e crie o repositório 'fut7pro-api'"
echo "2. Configure o remote: git remote add origin https://github.com/SEU_USUARIO/fut7pro-api.git"
echo "3. Faça push: git push -u origin main"
echo "4. Importe na Vercel: https://vercel.com"
echo "5. Configure domínio: api.fut7pro.com.br"
