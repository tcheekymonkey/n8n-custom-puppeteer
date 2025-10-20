# 1. Start from the official n8n image, but pull from GitHub's registry
FROM ghcr.io/n8n-io/n8n:1.115.2

# 2. Switch to the root user to get permission to install software.
USER root

# 3. Use Alpine's 'apk' package manager to install Chromium and its dependencies.
RUN apk update && apk add --no-cache \
    chromium \
    nss \
    alsa-lib \
    libxscrnsaver \
    libxtst

# 4. Switch back to the non-root 'node' user for security.
USER node
