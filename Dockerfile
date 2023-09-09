# Usar la última versión de Ubuntu como imagen base
FROM ubuntu:latest

# Actualizar la lista de paquetes e instalar wget
RUN apt-get update && \
    apt-get install -y wget gnupg

# Añadir la clave de firma de Google y el repositorio para instalar Google Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google-chrome.list \
    && apt-get update \
    && apt-get install -y google-chrome-stable

# Argumento para especificar la versión de Screaming Frog
ARG SCREAMING_FROG_VERSION

# Descargar e instalar Screaming Frog SEO Spider
RUN wget https://download.screamingfrog.co.uk/products/seo-spider/screamingfrogseospider_${SCREAMING_FROG_VERSION}_all.deb && \
    dpkg -i screamingfrogseospider_${SCREAMING_FROG_VERSION}_all.deb || true && \
    apt-get install -f -y

# Establecer la variable de entorno para la licencia de Screaming Frog
ENV SCREAMING_FROG_LICENSE=""
