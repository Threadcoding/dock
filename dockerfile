FROM jlesage/firefox

# Trick Render into seeing this as HTTP
ENV NOVNC_HTTP_PORT=80
EXPOSE 80

# Real configuration
ENV DISPLAY=:0
ENV NOVNC_PORT=5800
