#!/bin/bash

echo "Starting Windows VM with minimal configuration..."

# Minimal QEMU configuration without problematic devices
qemu-system-x86_64 \
    -m 8G \
    -smp 4 \
    -accel tcg \
    -cpu qemu64 \
    -drive file=/windows.qcow2,format=qcow2 \
    -netdev user,id=net0,hostfwd=tcp::3389-:3389 \
    -device e1000,netdev=net0 \
    -vga std \
    -display none \
    -vnc 0.0.0.0:0 \
    -daemonize

echo "Windows VM started successfully!"
echo "RDP available on port 3389"
echo "VNC available on port 5900"

# Keep container running
tail -f /dev/null
