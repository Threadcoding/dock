FROM lscr.io/linuxserver/firefox:latest

# Switch to root user for package installation
USER root

# Update package lists and install nodejs and npm
RUN apt-get update && \
    apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install PageCrypt globally
RUN npm install -g @robertklep/pagecrypt

# Copy and encrypt the index.html
COPY index.html /app/index.html
RUN pagecrypt /app/index.html /app/index.encrypted.html --password "Passwordadmin123"

# Create /tmp/.X11-unix with correct permissions
RUN mkdir -p /tmp/.X11-unix && chmod 1777 /tmp/.X11-unix

# Set environment variables
ENV SELKIES_DISABLE_GAMEPAD=true
ENV NO_X11=true
ENV PUID=1000
ENV PGID=1000
ENV TZ=Australia/Perth
ENV FIREFOX_CLI=https://outlook.live.com

# Switch back to the non-root user
USER abc
