#!/bin/bash

echo "Starting Windows VM..."

# Start QEMU in background but keep container alive
qemu-system-x86_64 \
    -m 8G \
    -smp 4 \
    -accel tcg \
    -cpu qemu64 \
    -drive file=/windows.qcow2,format=qcow2,if=virtio \
    -device virtio-vga \
    -device virtio-net,netdev=net0 \
    -netdev user,id=net0,hostfwd=tcp::3389-:3389,hostfwd=tcp::5900-:5900 \
    -device usb-tablet \
    -device intel-hda \
    -device hda-output \
    -display none \
    -vnc :0 \
    -daemonize

echo "QEMU started in background"
echo "RDP port: 3389"
echo "VNC port: 5900"

# Keep container alive by monitoring QEMU process
while ps aux | grep -q "[q]emu-system"; do
    sleep 30
done

echo "QEMU process stopped, exiting container"
