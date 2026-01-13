FROM docker.n8n.io/n8nio/n8n:2.4.1

USER root
RUN set -eux; \
    if command -v apk >/dev/null 2>&1; then \
        apk add --no-cache ffmpeg; \
    elif command -v apt-get >/dev/null 2>&1; then \
        apt-get update \
        && apt-get install -y --no-install-recommends ffmpeg \
        && rm -rf /var/lib/apt/lists/*; \
    else \
        echo "Unknown base OS: can't install ffmpeg" >&2; exit 1; \
    fi
USER node
