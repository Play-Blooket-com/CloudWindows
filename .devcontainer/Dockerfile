FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       dbus-x11 \
       novnc \
       websockify \
       xfce4 \
       xfce4-terminal \
       x11vnc \
       xvfb \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 6080
