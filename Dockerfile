FROM node:16.15-alpine AS builder
WORKDIR /app
COPY . .
RUN npm install \
    && npm run build

FROM nginx:1.21.6-alpine AS server
WORKDIR /usr/share/nginx/html
COPY --from=builder /app/dist ./
