# Usa a imagem oficial do Node.js
FROM node:18

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia os arquivos do backend para dentro do container
COPY backend/ .

# Instala as dependências
RUN npm install

# Expõe a porta usada pelo backend (ajuste se usar outra)
EXPOSE 3000

# Comando para iniciar o servidor
CMD ["npm", "run", "dev"]
