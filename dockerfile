# Use Playwright image so browsers and deps are already present
FROM mcr.microsoft.com/playwright:latest

# metadata
LABEL maintainer="you@example.com"

# Install git and other build deps (if needed)
RUN apt-get update && apt-get install -y git build-essential \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/patchright

# Replace with the repo you want (driver or nodejs package)
# here we clone the nodejs wrapper (patchright-nodejs)
RUN git clone https://github.com/Kaliiiiiiiiii-Vinyzu/patchright-nodejs.git /opt/patchright

WORKDIR /opt/patchright
RUN npm ci --no-audit --no-fund

# Optionally install Chrome channel used by patchright (if required)
# RUN npx patchright install chrome

# Expose ports if your app provides an API (change as needed)
EXPOSE 3000

# If repository provides a start script:
CMD ["node", "your-server-entry.js"]
