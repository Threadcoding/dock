FROM ubuntu:22.04

# Install QEMU
RUN apt-get update && apt-get install -y \
    qemu-system-x86 \
    qemu-utils \
    && rm -rf /var/lib/apt/lists/*

# Download a pre-made Windows QCOW2 image (you need to provide this)
# ADD https://your-domain.com/windows-10.qcow2 /windows.qcow2

# Or create an empty disk for Windows installation
RUN qemu-img create -f qcow2 /windows.qcow2 256G

COPY start-windows.sh /start-windows.sh
RUN chmod +x /start-windows.sh

EXPOSE 3389 5900

CMD ["/start-windows.sh"]
