# Use a base image that doesn't require device access
FROM ubuntu:20.04

# Install QEMU with software emulation only
RUN apt-get update && apt-get install -y \
    qemu-system-x86 \
    qemu-utils \
    spice-vdagent \
    && rm -rf /var/lib/apt/lists/*

# Download Windows ISO (you'll need to provide this)
# ADD Win10_22H2_English_x64.iso /windows.iso

# Create disk image
RUN qemu-img create -f qcow2 /windows.qcow2 256G

# Startup script
COPY start-windows.sh /start-windows.sh
RUN chmod +x /start-windows.sh

EXPOSE 3389

CMD ["/start-windows.sh"]
