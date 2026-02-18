FROM mcr.microsoft.com/playwright:latest

# Use this to link the image to your repo in GHCR
LABEL org.opencontainers.image.source="https://github.com/Kaliiiiiiiiii-Vinyzu/patchright-nodejs"

# 1. Install System Dependencies
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    xvfb \
    x11vnc \
    fluxbox \
    dbus-x11 \
    dos2unix \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# 2. Setup Patchright
WORKDIR /opt/deps
RUN npm init -y && \
    npm install patchright && \
    npx patchright install --with-deps chromium

WORKDIR /opt/app

# 3. Env Vars
ENV NODE_PATH=/opt/deps/node_modules
ENV PLAYWRIGHT_BROWSERS_PATH=/ms-playwright
ENV DISPLAY=:99

# 4. Script Setup
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
# Keep the container running
CMD ["sleep", "infinity"]