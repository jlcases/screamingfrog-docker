#!/bin/bash

# Obtener la última versión de Screaming Frog desde la página web
SCREAMING_FROG_VERSION=$(curl -s https://www.screamingfrog.co.uk/seo-spider/ | grep -oP 'screamingfrogseospider_\K[0-9.]+(?=_all.deb)')

# Construir la imagen Docker con la versión obtenida
docker build --build-arg SCREAMING_FROG_VERSION=$SCREAMING_FROG_VERSION -t screamingfrog .
