#!/bin/bash

# Inicia o DBus
service dbus start

# Inicia o PipeWire (substituto do PulseAudio no Debian 12)
pipewire &
pipewire-pulse &
wireplumber &

# Aguarda o PipeWire iniciar completamente
sleep 2

# Inicia o XRDP
service xrdp start

# Cria diretório do X11
mkdir -p /tmp/.X11-unix
chmod 1777 /tmp/.X11-unix

# Mantém o container rodando e mostra logs
tail -f /var/log/xrdp-sesman.log
