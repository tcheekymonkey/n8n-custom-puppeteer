# 1. Start from the official n8n image.
FROM n8nio/n8n:1.115.2

# 2. Switch to the root user to get permission to install software.
USER root

# 3. Use Alpine's 'apk' package manager to install Chromium.
# '--no-cache' is a best practice to keep the image small.
RUN apk update && apk add --no-cache \
    chromium \
    nss \
    libxss \
    libasound \
    libxtst

# 4. Switch back to the non-root 'node' user for security.
USER node
