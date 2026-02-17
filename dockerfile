FROM mcr.microsoft.com/playwright:latest

# Use this to link the image to your repo in GHCR
LABEL org.opencontainers.image.source="https://github.com/Kaliiiiiiiiii-Vinyzu/patchright-nodejs"

# 1. Setup the dependencies directory
WORKDIR /deps

# We combine these into one RUN to ensure they happen in the same layer
# and we add 'ls' at the end to force the build log to show us the result
RUN npm init -y && \
    npm install patchright && \
    npx patchright install --with-deps chromium && \
    ls -lah /deps/node_modules  # This verifies it worked during the build

# 2. Setup the application directory
WORKDIR /app

# 3. Environment Variables
# This tells Node where the library is
ENV NODE_PATH=/deps/node_modules
# This tells Patchright where the chromium binary is
ENV PLAYWRIGHT_BROWSERS_PATH=/ms-playwright

ENTRYPOINT []
CMD ["sleep", "infinity"]