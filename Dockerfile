FROM node:22-alpine AS builder
WORKDIR /app
COPY . .
RUN npm install \
    && npm run build

FROM nginx:1.27.3-alpine AS server
WORKDIR /usr/share/nginx/html
COPY --from=builder /app/dist ./
