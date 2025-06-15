# 🚀 Guia Rápido de Deploy

## Como fazer deploy do conteúdo de forma simples

### ✅ **Método Super Simples (Recomendado)**

```powershell
# Deploy rápido com mensagem automática
.\quick-deploy.ps1

# Deploy com mensagem personalizada
.\quick-deploy.ps1 "Adicionei novo post sobre Corpus Christi"
```

### 📋 **Método Manual (Passo a Passo)**

```powershell
# 1. Adicionar arquivos
git add conteudo/

# 2. Fazer commit
git commit -m "Sua mensagem aqui"

# 3. Fazer push (SEM PULL)
git push origin main
```

## 🎯 **Quando Usar Cada Método**

### Use o **Script Automático** quando:
- ✅ Você quer rapidez
- ✅ Não se importa com mensagens automáticas
- ✅ Quer evitar erros de digitação

### Use o **Método Manual** quando:
- ✅ Quer controle total sobre a mensagem
- ✅ Quer verificar cada passo
- ✅ Está aprendendo Git

## 🔧 **Configuração Inicial (Só Fazer Uma Vez)**

```powershell
# Permitir execução de scripts PowerShell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## 📁 **Estrutura do Projeto**

```
church-scraper-v1/
├── conteudo/                    # 👈 Seus arquivos de conteúdo
│   ├── corpus-christi.json
│   ├── corpus-christi.html
│   └── flutter-ui-guide.md
├── quick-deploy.ps1             # 👈 Script de deploy rápido
└── deploy-simple.ps1            # 👈 Script completo (alternativo)
```

## 🚨 **Regras Importantes**

1. **NUNCA faça `git pull`** antes do push (pode causar conflitos)
2. **SEMPRE use `git push origin main`** para forçar o envio
3. **SÓ modifique arquivos na pasta `conteudo/`** para este workflow
4. **Execute os scripts na raiz do projeto** (onde está a pasta `conteudo/`)

## 🎉 **Exemplos de Uso**

```powershell
# Deploy básico
.\quick-deploy.ps1

# Deploy com mensagem específica
.\quick-deploy.ps1 "Novo post: Corpus Christi completo"

# Deploy com data específica
.\quick-deploy.ps1 "Atualização $(Get-Date -Format 'dd/MM/yyyy')"
```

## 🔗 **Links Úteis**

- **Repositório:** https://github.com/rsoshiro/church-source.git
- **Documentação Completa:** README-DEPLOY.md
- **Guia Flutter:** conteudo/flutter-ui-guide.md 