# Script de Deploy Rápido - Conteúdo
param([string]$msg = "Atualização de conteúdo - $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')")

Write-Host "🚀 DEPLOY RÁPIDO" -ForegroundColor Cyan
Write-Host "=================" -ForegroundColor Cyan

if (-not (Test-Path "conteudo")) {
    Write-Host "❌ Erro: Pasta 'conteudo' não encontrada!" -ForegroundColor Red
    exit 1
}

Write-Host "📁 Adicionando arquivos..." -ForegroundColor Yellow
git add conteudo/

Write-Host "💾 Fazendo commit..." -ForegroundColor Yellow
git commit -m $msg

Write-Host "🌐 Enviando para GitHub..." -ForegroundColor Yellow
git push origin main

Write-Host "✅ DEPLOY CONCLUÍDO!" -ForegroundColor Green
Write-Host "📝 Mensagem: $msg" -ForegroundColor Green 