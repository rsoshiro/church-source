# 🚀 COMO FAZER DEPLOY

## ✅ MÉTODO SIMPLES (RECOMENDADO)

```powershell
# Deploy básico
.\deploy.ps1

# Deploy com mensagem personalizada
.\deploy.ps1 "Minha mensagem aqui"
```

## 📋 MÉTODO MANUAL (3 comandos)

```powershell
git add conteudo/
git commit -m "Minha mensagem"
git push origin main
```

## 🚨 LEMBRE-SE

- Use `.\deploy.ps1` (com PONTO e barra)
- NÃO use `\deploy.ps1` (sem ponto)
- Execute na pasta raiz do projeto
- Só modifique arquivos em `conteudo/`

## 🎯 EXEMPLO PRÁTICO

1. Modifique um arquivo em `conteudo/`
2. Execute: `.\deploy.ps1 "Atualizei o post do Corpus Christi"`
3. Pronto! Está no GitHub

## 🔗 REPOSITÓRIO

https://github.com/rsoshiro/church-source.git 