#!/bin/sh

# Установка community-нодов при запуске
npm install n8n-nodes-apify n8n-nodes-docxtemplater

# Запуск n8n
exec n8n
