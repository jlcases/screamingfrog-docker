FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y wget

ARG SCREAMING_FROG_VERSION

RUN wget https://download.screamingfrog.co.uk/products/seo-spider/screamingfrogseospider_${SCREAMING_FROG_VERSION}_all.deb && \
    dpkg -i screamingfrogseospider_${SCREAMING_FROG_VERSION}_all.deb || true && \
    apt-get install -f -y

ENV SCREAMING_FROG_LICENSE=""