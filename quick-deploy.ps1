# Quick Deploy Script - Conteúdo para Git
# Uso: .\quick-deploy.ps1 "Sua mensagem de commit"

param(
    [string]$Message = "Atualização de conteúdo - $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
)

Write-Host "🚀 QUICK DEPLOY - CONTEÚDO" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan

# Verificar se estamos no diretório correto
if (-not (Test-Path "conteudo")) {
    Write-Host "❌ Erro: Diretório 'conteudo' não encontrado!" -ForegroundColor Red
    Write-Host "Execute este script na raiz do projeto." -ForegroundColor Yellow
    exit 1
}

try {
    # 1. Adicionar arquivos do conteúdo
    Write-Host "📁 Adicionando arquivos do diretório conteudo..." -ForegroundColor Yellow
    git add conteudo/
    
    # 2. Fazer commit
    Write-Host "💾 Fazendo commit..." -ForegroundColor Yellow
    git commit -m $Message
    
    # 3. Fazer push (sem pull)
    Write-Host "🌐 Enviando para GitHub..." -ForegroundColor Yellow
    git push origin main
    
    Write-Host "✅ DEPLOY CONCLUÍDO COM SUCESSO!" -ForegroundColor Green
    Write-Host "📝 Mensagem: $Message" -ForegroundColor Green
    Write-Host "🔗 Repositório: https://github.com/rsoshiro/church-source.git" -ForegroundColor Cyan
    
} catch {
    Write-Host "❌ Erro durante o deploy: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

Write-Host "`n🎯 COMO USAR ESTE SCRIPT:" -ForegroundColor Magenta
Write-Host "1. Sem mensagem personalizada:" -ForegroundColor White
Write-Host "   .\quick-deploy.ps1" -ForegroundColor Gray
Write-Host "2. Com mensagem personalizada:" -ForegroundColor White
Write-Host "   .\quick-deploy.ps1 'Adicionei novo post sobre Corpus Christi'" -ForegroundColor Gray 