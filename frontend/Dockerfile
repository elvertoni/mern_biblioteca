# Usa a imagem oficial do Node.js
FROM node:18

# Define diretório de trabalho
WORKDIR /app

# Copia os arquivos do frontend
COPY frontend/ .

# Instala as dependências e compila a aplicação
RUN npm install && npm run build

# Instala um servidor HTTP para servir os arquivos estáticos
RUN npm install -g serve

# Expõe a porta padrão do serve
EXPOSE 3000

# Comando que roda o build
CMD ["npm", "run", "dev"]
