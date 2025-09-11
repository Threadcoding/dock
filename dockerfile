FROM dockurr/windows

# Environment variables
ENV VERSION="10"
ENV DISK_SIZE="256G"
ENV RAM_SIZE="8G"
ENV CPU_CORES="4"
ENV USERNAME="bill"
ENV PASSWORD="gates"
ENV LANGUAGE="English"
ENV RDP_RESOLUTION="1920x1080"
ENV RDP_SESSION="rdp"
ENV RDP_AUDIO="rdp"

# Expose ports
EXPOSE 3389
EXPOSE 8000

# Add health check
HEALTHCHECK --interval=30s --timeout=30s --start-period=300s --retries=3 \
  CMD netstat -an | grep 3389 > /dev/null || exit 1

# Entrypoint remains from base image
