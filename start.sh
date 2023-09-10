#!/bin/bash

# Iniciar un pequeño servidor web para servir la página HTML
python3 -m http.server 80 &

# Iniciar el servidor X virtual
Xvfb :99 -screen 0 1024x768x24 &

# Iniciar el servidor noVNC
websockify 6080 localhost:5900 &

# Iniciar el servidor VNC con el entorno de escritorio XFCE
x11vnc -forever -usepw -create -env FD_XDM=1 -env X11VNC_CREATE_GEOM=1024x768x24 &

# Espera un momento para asegurar que el servidor X esté listo
sleep 20

# Establecer la variable de entorno DISPLAY para asegurar que la aplicación pueda abrirse correctamente
export DISPLAY=:99

# Iniciar Screaming Frog SEO Spider sin esperar una clave de licencia
screamingfrogseospider






