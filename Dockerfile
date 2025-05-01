# syntax=docker/dockerfile:1.3
FROM n8nio/n8n:latest

USER root

ARG CACHE_BREAKER=1

# Копируем package.json
COPY custom-nodes/package.json /custom-nodes/package.json

# Устанавливаем кастомные ноды (npm install)
RUN cd /custom-nodes && npm install

# Копируем node_modules (обязательно для работы в n8n)
COPY custom-nodes/node_modules/ /home/node/.n8n/custom-nodes/node_modules/

# Копируем сам код нод (если есть js-файлы)
COPY custom-nodes/ /home/node/.n8n/custom-nodes/

# Копируем скрипт запуска
COPY --chmod=755 entrypoint.sh /entrypoint.sh

USER node
ENTRYPOINT ["/entrypoint.sh"]
