# syntax=docker/dockerfile:1.3
FROM n8nio/n8n:latest

USER root
COPY --chmod=755 entrypoint.sh /entrypoint.sh
USER node

ENTRYPOINT ["/entrypoint.sh"]
