FROM dockurr/windows

# Environment variables to fix the errors
ENV VERSION="10"
ENV DISK_SIZE="256G"
ENV RAM_SIZE="8G"
ENV CPU_CORES="4"
ENV USERNAME="bill"
ENV PASSWORD="gates"
ENV LANGUAGE="English"
ENV RDP_RESOLUTION="1920x1080"
ENV ACCELERATION="none"      # Disable KVM acceleration
ENV TUN_NETDEV="off"         # Disable TUN device requirement
ENV USER_PORTS="on"          # Enable user-mode networking
ENV MTU="1500"               # Set proper MTU size

# Expose ports
EXPOSE 3389

# Add startup script to handle the limitations
COPY entrypoint-fix.sh /entrypoint-fix.sh
RUN chmod +x /entrypoint-fix.sh

# Use the fixed entrypoint
ENTRYPOINT ["/entrypoint-fix.sh"]
