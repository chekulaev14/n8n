# Используем официальный образ n8n
FROM n8nio/n8n:latest

# Переключаемся на root для установки community-нод
USER root

# Переходим в директорию движка n8n
WORKDIR /usr/local/lib/node_modules/n8n

# Удаляем старые версии (обход кэша)
RUN rm -rf node_modules/n8n-nodes-apify node_modules/n8n-nodes-docxtemplater || true

# Устанавливаем community-ноды и чистим мусор
RUN npm install n8n-nodes-apify n8n-nodes-docxtemplater \
  && npm prune --production \
  && npm cache clean --force

# Возвращаемся к непривилегированному пользователю
USER node

# Восстанавливаем стандартную рабочую директорию
WORKDIR /home/node
