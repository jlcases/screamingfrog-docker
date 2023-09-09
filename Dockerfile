# Use the latest version of Ubuntu as the base image
FROM ubuntu:latest

# Update the package list and install necessary tools
RUN apt-get update && \
    apt-get install -y wget gnupg apt-transport-https x11vnc xvfb

# Add Google's signing key to the specific keyring and add the repository to install Google Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/google-archive-keyring.gpg \
    && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-archive-keyring.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google-chrome.list > /dev/null \
    && apt-get update \
    && apt-get install -y google-chrome-stable

# Argument to specify the version of Screaming Frog
ARG SCREAMING_FROG_VERSION

# Download and install Screaming Frog SEO Spider
RUN wget https://download.screamingfrog.co.uk/products/seo-spider/screamingfrogseospider_${SCREAMING_FROG_VERSION}_all.deb && \
    dpkg -i screamingfrogseospider_${SCREAMING_FROG_VERSION}_all.deb || true && \
    apt-get install -f -y

# Set the environment variable for the Screaming Frog license
ENV SCREAMING_FROG_LICENSE=""

# Set up VNC server to allow remote access to the GUI
RUN mkdir ~/.vnc \
    && x11vnc -storepasswd yourpassword ~/.vnc/passwd

# Expose the necessary port for the VNC server
EXPOSE 5900

# Set up the VNC server as a service that starts automatically
ENTRYPOINT ["x11vnc", "-forever", "-usepw", "-create"]


