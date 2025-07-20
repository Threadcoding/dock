FROM lscr.io/linuxserver/firefox:latest

# Install Node.js and PageCrypt
USER root
RUN apt-get update && apt-get install -y nodejs npm && apt-get clean
RUN npm install -g @robertklep/pagecrypt

# Copy a custom index.html with PageCrypt
COPY index.html /app/index.html
RUN pagecrypt /app/index.html /app/index.encrypted.html --password "Passwordadmin123"

# Serve the encrypted page
ENV NGINX_PORT=3000
ENV SELKIES_DISABLE_GAMEPAD=true
ENV PUID=1000
ENV PGID=1000
ENV TZ=Australia/Perth
ENV FIREFOX_CLI=https://outlook.live.com

USER abc
