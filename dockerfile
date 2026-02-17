# See Playwright Docker docs for details. (https://playwright.dev/docs/docker)
FROM mcr.microsoft.com/playwright:latest

LABEL org.opencontainers.image.source="https://github.com/Kaliiiiiiiiii-Vinyzu/patchright-nodejs"

# This forces Docker to actually run the installs if you change the build command
#ARG BUILD_DATE=unknown

# Install the patchright npm package globally so this image can be used as a drop-in
# Playwright runtime with Patchright patched-in.
# Create and install in /deps
WORKDIR /deps
RUN npm init -y && npm i -g patchright

# Install the chromium driver/binary that Patchright expects (same command from repo docs).
# If you prefer Chrome, change "chromium" to "chrome" and ensure you have the right channel available.
RUN npx patchright install --with-deps chromium
# RUN npx patchright install chromium

# Set workdir for the app
WORKDIR /usr/src/app
ENV NODE_PATH=/deps/node_modules
# Ensure browsers are found where they were installed
#ENV PLAYWRIGHT_BROWSERS_PATH=/ms-playwright 

ENTRYPOINT []
CMD ["sleep", "infinity"]