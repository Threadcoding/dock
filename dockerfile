# Base image with Firefox
FROM jlesage/firefox

# Expose the VNC port (5800 = web interface)
EXPOSE 5800

# Optional: Set a login password (replace 'yourpassword')
ENV LOGIN_USERNAME=Admin24 LOGIN_PASSWORD=ITTHTEST2024

# Optional: Auto-install extensions (e.g., Multi-Account Containers)
RUN mkdir -p /config/extensions
ADD https://addons.mozilla.org/firefox/downloads/latest/multi-account-containers/addon.xpi /config/extensions/multi-account-containers.xpi
