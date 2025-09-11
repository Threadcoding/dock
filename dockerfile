FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    qemu-system-x86 \
    qemu-utils \
    net-tools \
    && rm -rf /var/lib/apt/lists/*

RUN qemu-img create -f qcow2 /windows.qcow2 256G

COPY start-windows.sh /start-windows.sh
RUN chmod +x /start-windows.sh

EXPOSE 3389 5900 8000

CMD ["/start-windows.sh"]
