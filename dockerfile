FROM ubuntu:22.04

# Install QEMU and necessary tools
RUN apt-get update && apt-get install -y \
    qemu-system-x86 \
    qemu-utils \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Create Windows disk image (256GB)
RUN qemu-img create -f qcow2 /windows.qcow2 256G

# Copy startup script
COPY start-windows.sh /start-windows.sh
RUN chmod +x /start-windows.sh

EXPOSE 3389

CMD ["/start-windows.sh"]
