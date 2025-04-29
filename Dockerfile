# Используем официальный образ n8n
FROM n8nio/n8n:latest

# Переключаемся на root для установки community-пакетов
USER root

# Переходим в директорию самого движка n8n
WORKDIR /usr/local/lib/node_modules/n8n

USER root
WORKDIR /usr/local/lib/node_modules/n8n

# Устанавливаем Apify и Docxtemplater через pnpm
RUN pnpm add --prod n8n-nodes-apify jreyesr/n8n-nodes-docxtemplater \
  && pnpm prune --prod \
  && pnpm store prune

USER node

# Восстанавливаем рабочую директорию по умолчанию
WORKDIR /home/node

# По желанию: задаём точную версию n8n (если не нужен latest)
# ARG N8N_VERSION=1.89.2
# FROM n8nio/n8n:${N8N_VERSION}
