#!/usr/bin/env bash
set -euo pipefail

if pgrep -f 'Xvfb :1' >/dev/null && pgrep -f 'websockify.*6080' >/dev/null; then
  echo "Desktop services already appear to be running."
  exit 0
fi

mkdir -p /tmp/.X11-unix
Xvfb :1 -screen 0 1280x800x24 -ac +extension GLX +render -noreset >/tmp/xvfb.log 2>&1 &
sleep 2

export DISPLAY=:1
dbus-launch --exit-with-session startxfce4 >/tmp/xfce.log 2>&1 &
sleep 3

x11vnc -display :1 -forever -shared -nopw -localhost -rfbport 5900 >/tmp/x11vnc.log 2>&1 &
websockify --web=/usr/share/novnc/ 6080 localhost:5900 >/tmp/websockify.log 2>&1 &

echo "Linux desktop started. Open the forwarded private port 6080 and choose Connect."
