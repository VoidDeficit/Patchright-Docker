# Patchright in Docker (with VNC Support)
This works now, however it is experimental so expect some bugs and glitches.

What this repository does:  
1. Watches the releases for Patchright https://github.com/Kaliiiiiiiiii-Vinyzu/patchright-nodejs
2. When it detects a new version for Patchright is released, build a docker container with the official Playwright image (https://hub.docker.com/r/microsoft/playwright) and patch it with Patchwrite
3. Pushes the docker container to a public repository

Then I should be able to let this script do it's thing unattended, and never look at this repository again. This will probably break at some point.

Files:   
- README.md - This is what you're reading now. General information that is meant to be read first.  
- dockerfile - this creates the docker image by starting with the Playwright image, and running some commands to install the latest versions of stuff.  
- scheduled_check_and_build.yml - This is the GitHub Actions. It runs every few hours and looks at patchright's current release number, and checks if it's new. If new, it runs the docker build script (dockerfile) and pushes the result to GitHub Container Repo
- docker-compose.yml - Ideally, you can make some minor edits to this and copy the contents to your docker compose system to run the generated image.

## Quick Start (VNC Access)

To see what the browser is doing, you can connect to the container via any VNC client:

* **VNC Port:** `5900`

This script is just bashing a few other people's products together (Playwright, Patchright, Docker, Docker Compose, GitHub), so you have to obey all of their terms of service and rules.

To Do:
- [ ] Write a test that runs on every build to make sure it's working correctly and lets me know if anything breaks
- [ ] Check for memory leaks
