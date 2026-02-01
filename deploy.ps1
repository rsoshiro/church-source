# Script de Deploy Rapido - Conteudo
param([string]$msg = "Atualizacao de conteudo - $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')")

Write-Host "DEPLOY RAPIDO" -ForegroundColor Cyan
Write-Host "=============" -ForegroundColor Cyan

if (-not (Test-Path "conteudo")) {
    Write-Host "ERRO: Pasta 'conteudo' nao encontrada!" -ForegroundColor Red
    exit 1
}

Write-Host "Adicionando arquivos..." -ForegroundColor Yellow
git add conteudo/

Write-Host "Fazendo commit..." -ForegroundColor Yellow
git commit -m $msg

Write-Host "Enviando para GitHub..." -ForegroundColor Yellow
git push origin main

Write-Host "DEPLOY CONCLUIDO!" -ForegroundColor Green
Write-Host "Mensagem: $msg" -ForegroundColor Green

Write-Host ""
Write-Host "COMO USAR:" -ForegroundColor Magenta
Write-Host "1. Deploy basico: .\deploy.ps1" -ForegroundColor White
Write-Host "2. Com mensagem: .\deploy.ps1 'Minha mensagem'" -ForegroundColor White 