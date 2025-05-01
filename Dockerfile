# syntax=docker/dockerfile:1.3
FROM n8nio/n8n:latest14

USER root

ARG CACHE_BREAKER=1

COPY custom-nodes/package.json /custom-nodes/package.json
RUN cd /custom-nodes && npm install

COPY custom-nodes/ /home/node/.n8n/custom-nodes/
COPY --chmod=755 entrypoint.sh /entrypoint.sh

USER node
ENTRYPOINT ["/entrypoint.sh"]
