# Используем официальный образ n8n
FROM n8nio/n8n:latest

# Переключаемся на пользователя root для установки community-пакетов
USER root

# Переходим в директорию с движком n8n
WORKDIR /usr/local/lib/node_modules/n8n

# Устанавливаем Apify, Docxtemplater и sqlite3 через pnpm, чистим dev-зависимости
RUN pnpm add --prod n8n-nodes-apify \
    jreyesr/n8n-nodes-docxtemplater \
    sqlite3 \
  && pnpm prune --prod \
  && pnpm store prune

# Возвращаемся к непривилегированному пользователю
USER node

# Устанавливаем рабочую директорию по умолчанию
WORKDIR /home/node

# Опционально: зафиксировать версию n8n
# ARG N8N_VERSION=1.89.2
# FROM n8nio/n8n:${N8N_VERSION}
