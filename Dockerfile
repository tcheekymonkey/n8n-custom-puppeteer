# 1. Start from the official n8n image.
# You can update the version tag as needed.
FROM n8nio/n8n:1.115.2

# 2. Switch to the root user to get permission to install software.
USER root

# 3. Update the package manager and install Chromium and its essential dependencies.
# These libraries are required for a browser to run in a headless Docker environment.
RUN apt-get update && apt-get install -y \
    chromium \
    libnss3 \
    libxss1 \
    libasound2 \
    libxtst6 \
    # Clean up afterward to keep the image small.
    && rm -rf /var/lib/apt/lists/*

# 4. Switch back to the non-root 'node' user for security.
USER node
