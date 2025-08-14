# ---- Build & Runtime base
FROM node:20-alpine

# Cloud Run usa 8080 por defecto
ENV PORT=8080
ENV NODE_ENV=production

# Crear directorio de trabajo
WORKDIR /usr/src/app

# Instalar solo deps de prod (más rápido y liviano)
COPY package.json package-lock.json* ./
RUN npm ci --omit=dev || npm i --omit=dev

# Copiar el código
COPY . .

# Asegura que el contenedor escuche en 0.0.0.0:8080
EXPOSE 8080

# Arranque
CMD ["npm", "start"]
