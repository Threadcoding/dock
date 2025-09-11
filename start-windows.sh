#!/bin/bash

# Start QEMU with software emulation only (no KVM, no TUN)
qemu-system-x86_64 \
    -m 8G \
    -smp 4 \
    -accel tcg \
    -cpu qemu64 \
    -drive file=/windows.qcow2,format=qcow2 \
    -cdrom /windows.iso \
    -boot d \
    -vga std \
    -device e1000,netdev=net0 \
    -netdev user,id=net0,hostfwd=tcp::3389-:3389 \
    -usbdevice tablet \
    -soundhw hda \
    -display none \
    -vnc :0
