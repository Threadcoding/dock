#!/bin/bash

echo "Starting Windows VM with software emulation..."

# Start QEMU with proper modern syntax
qemu-system-x86_64 \
    -m 8G \
    -smp 4 \
    -accel tcg \
    -cpu qemu64 \
    -drive file=/windows.qcow2,format=qcow2,if=virtio \
    -device virtio-vga \
    -device virtio-net,netdev=net0 \
    -netdev user,id=net0,hostfwd=tcp::3389-:3389 \
    -device usb-tablet \
    -device intel-hda \
    -device hda-output \
    -display none \
    -vnc :0 \
    -daemonize

echo "Windows VM started in background. RDP available on port 3389."
echo "You'll need to install Windows on the virtual disk first."
echo "Connect via RDP to: $(hostname -i):3389"

# Keep container running
tail -f /dev/null
