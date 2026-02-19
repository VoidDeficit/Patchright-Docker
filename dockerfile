FROM mcr.microsoft.com/playwright:latest

LABEL org.opencontainers.image.source="https://github.com/Kaliiiiiiiiii-Vinyzu/patchright-nodejs"

WORKDIR /opt/deps

RUN npm init -y && \
    npm install patchright && \
    npx patchright install --with-deps firefox

WORKDIR /opt/app

ENV NODE_PATH=/deps/node_modules
ENV PLAYWRIGHT_BROWSERS_PATH=/ms-playwright

ENTRYPOINT []
CMD ["sleep", "infinity"]