#!/bin/bash

# Fix for Render environment limitations
echo "Configuring for Render environment..."

# Set proper MTU size (fixes the MTU too large error)
ip link set mtu 1500

# Wait a bit for network to initialize
sleep 2

# Start the original entrypoint with fixed environment
exec /entrypoint.sh
