# syntax=docker/dockerfile:1.3
FROM n8nio/n8n:latest

USER root

# Сброс кэша (можешь увеличивать значение при необходимости)
ARG CACHE_BREAKER=1

# Копируем файл с зависимостями кастомных нод
COPY custom-nodes/package.json /custom-nodes/package.json

# Устанавливаем кастомные ноды
RUN cd /custom-nodes && npm install

# Копируем скрипт запуска
COPY --chmod=755 entrypoint.sh /entrypoint.sh

USER node
ENTRYPOINT ["/entrypoint.sh"]
