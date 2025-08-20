# Dockerfile
FROM docker.n8n.io/n8nio/n8n:latest

# Need ffmpeg inside the container
USER root
RUN apt-get update \
 && apt-get install -y --no-install-recommends ffmpeg \
 && rm -rf /var/lib/apt/lists/*
USER node