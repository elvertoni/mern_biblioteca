# Estágio 1: Build do Frontend (React + Vite)
FROM node:18-alpine AS build-frontend

WORKDIR /app/frontend

# Copia os arquivos de dependência do frontend
COPY frontend/package.json frontend/package-lock.json* ./

# Instala as dependências do frontend
RUN npm install

# Copia o restante do código do frontend
COPY frontend/ .

# Constrói a aplicação frontend para produção
RUN npm run build

# Estágio 2: Configuração do Backend (Node.js + Express)
FROM node:18-alpine

WORKDIR /app

# Copia os arquivos de dependência da raiz (que contém as dependências do backend)
COPY package.json package-lock.json* ./

# Copia o código do backend
COPY backend ./backend

# Instala apenas as dependências de produção do backend
RUN npm install --production

# Copia os arquivos estáticos construídos do frontend do estágio anterior
COPY --from=build-frontend /app/frontend/dist ./frontend/dist

# Define variáveis de ambiente
ENV NODE_ENV=production
ENV PORT=3000

# Expõe a porta que o backend vai usar
EXPOSE 3000

# Comando para iniciar o servidor backend (que também serve o frontend)
CMD ["node", "backend/server.js"]
