#!/bin/bash

echo "Starting Windows VM..."

# Start a simple HTTP server on port 8080 for Render detection
while true; do
    echo -e "HTTP/1.1 200 OK\n\nOK" | nc -l -p 8080 -q 1
done &

# Start QEMU
qemu-system-x86_64 \
    -m 8G \
    -smp 4 \
    -accel tcg \
    -cpu qemu64 \
    -drive file=/windows.qcow2,format=qcow2 \
    -netdev user,id=net0,hostfwd=tcp::3389-:3389,hostfwd=tcp::5900-:5900 \
    -device e1000,netdev=net0 \
    -vga std \
    -display none \
    -vnc 0.0.0.0:0 \
    -daemonize

echo "Windows VM started!"
echo "RDP: port 3389, VNC: port 5900, HTTP: port 8080"

# Keep container alive
tail -f /dev/null
