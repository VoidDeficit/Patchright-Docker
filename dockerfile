# See Playwright Docker docs for details. (https://playwright.dev/docs/docker)
FROM mcr.microsoft.com/playwright:latest

LABEL org.opencontainers.image.source="https://github.com/Kaliiiiiiiiii-Vinyzu/patchright-nodejs"
WORKDIR /usr/src/app

# Install the patchright npm package globally so this image can be used as a drop-in
# Playwright runtime with Patchright patched-in.
RUN npm i -g patchright

# Install the chromium driver/binary that Patchright expects (same command from repo docs).
# If you prefer Chrome, change "chromium" to "chrome" and ensure you have the right channel available.
RUN npx patchright install chromium
# RUN npx patchright install chromium

# Default to node so container can be used to run Playwright/patchright scripts.
ENTRYPOINT ["node"]
CMD ["-v"]
