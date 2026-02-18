#!/bin/bash
set -e # Exit immediately if a command fails

echo "Starting Xvfb..."
Xvfb :99 -ac -screen 0 1280x1024x24 &
export DISPLAY=:99

echo "Starting Fluxbox..."
fluxbox &

echo "Starting VNC Server on port 5900..."
# -shared allows multiple connections
# -bg runs it in background
x11vnc -display :99 -nopw -forever -shared -bg -rfbport 5900

echo "VNC Setup Complete. Container is ready."

# This ensures the container stays alive and executes 
# whatever command was passed (like 'sleep infinity')
exec "$@"