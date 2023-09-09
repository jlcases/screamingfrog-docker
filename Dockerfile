FROM ubuntu:latest

# Instalar las herramientas necesarias
RUN apt-get update && \
    apt-get install -y wget curl grep x11vnc xvfb fluxbox

# Obtener la última versión de Screaming Frog SEO Spider
RUN SCREAMING_FROG_VERSION=$(curl -s https://www.screamingfrog.co.uk/seo-spider/ | grep -oP 'screamingfrogseospider_\K[0-9.]+(?=_all.deb)') && \
    wget https://download.screamingfrog.co.uk/products/seo-spider/screamingfrogseospider_$SCREAMING_FROG_VERSION_all.deb && \
    dpkg -i screamingfrogseospider_$SCREAMING_FROG_VERSION_all.deb || true && \
    apt-get install -f -y

# Configurar la variable de entorno para la licencia
ENV SCREAMING_FROG_LICENSE=""

# Configurar VNC
RUN mkdir ~/.vnc
RUN x11vnc -storepasswd 1234 ~/.vnc/passwd

# Configurar el script de inicio
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]

