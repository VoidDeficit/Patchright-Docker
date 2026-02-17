# See Playwright Docker docs for details. (https://playwright.dev/docs/docker)
FROM mcr.microsoft.com/playwright:latest

LABEL org.opencontainers.image.source="https://github.com/Kaliiiiiiiiii-Vinyzu/patchright-nodejs"

# 1. Install Patchright in the parent directory
WORKDIR /deps
RUN npm init -y && npm -i -g patchright
RUN npx patchright install --with-deps chromium

# 2. Set the working directory to the app folder
WORKDIR /usr/src/app

# 3. Tell Node to look for modules in the parent folder
ENV NODE_PATH=/deps/node_modules

ENTRYPOINT []
CMD ["sleep", "infinity"]