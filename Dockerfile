# Use the latest version of Ubuntu as the base image
FROM ubuntu:latest

# Set the environment variable to disable the interactive timezone configuration
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install necessary tools and dependencies
RUN apt-get update && \
    apt-get install -y wget gnupg apt-transport-https python3 python3-pip x11vnc xvfb zenity libgconf-2-4 libgtk2.0-0 net-tools tzdata xfce4 && \
    ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install noVNC
RUN pip3 install websockify

# Add Google's signing key to the specific keyring and add the repository to install Google Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/google-archive-keyring.gpg && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-archive-keyring.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google-chrome.list > /dev/null && \
    apt-get update && \
    apt-get install -y google-chrome-stable && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Argument to specify the version of Screaming Frog
ARG SCREAMING_FROG_VERSION

# Download and install Screaming Frog SEO Spider
RUN wget https://download.screamingfrog.co.uk/products/seo-spider/screamingfrogseospider_${SCREAMING_FROG_VERSION}_all.deb && \
    dpkg -i screamingfrogseospider_${SCREAMING_FROG_VERSION}_all.deb || true && \
    apt-get update && \
    apt-get install -f -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm screamingfrogseospider_${SCREAMING_FROG_VERSION}_all.deb

# Set the environment variable for the Screaming Frog license
ENV SCREAMING_FROG_LICENSE=""

# Set up VNC server to allow remote access to the GUI
ENV VNC_PASSWORD=yourpassword
RUN mkdir ~/.vnc && \
    x11vnc -storepasswd $VNC_PASSWORD ~/.vnc/passwd

# Set the DISPLAY environment variable to use the virtual X server
ENV DISPLAY=:99

# Expose the necessary port for the VNC server, noVNC, and HTTP server
EXPOSE 5900 6080 80

# Copy the start script to the container
COPY start.sh /start.sh

# Make the script executable
RUN chmod +x /start.sh

# Use the script as the entry point
ENTRYPOINT ["/start.sh"]
