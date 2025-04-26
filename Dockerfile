FROM n8nio/n8n:latest

# Устанавливаем Apify-интеграцию
RUN npm install n8n-nodes-apify
RUN npm cache clean --force
