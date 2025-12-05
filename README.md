# I-want-to-run-Patchright-in-Docker
Why can't I run patchright in docker? I don't know why somebody hasn't done this before me, so lets find out together. I want it to be a drop-in replacement for Playwrite docker, so I can just point stuff to the open port, and it'll use Patchright instead of Playwrite. I'm probably making some assumptions that will break it along the way, but I'd like to learn about Playwrite, GitHub actions, and Docker, so lets figure it out.

I want to make something that:
1. Watches the releases for Patchright https://github.com/Kaliiiiiiiiii-Vinyzu/patchright
2. When it detects a new version for Patchright is released, build a docker container with Playwrite and patch it with Patchwrite
3. Pushes the docker container to a public repository

Then I should be able to let this script do it's thing unattended, and never look at this repository again. This will probably break at some point, and since I don't know what I'm doing, I won't be able to fix it. But maybe it'll be nice in the meantime!

This script is just bashing a few other people's products together (Playwrite, Patchright, Docker, Docker Compose, GitHub), so you have to obey all of their terms of service and rules.
