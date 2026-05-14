#!/bin/bash

# Check for Tailscale status
if tailscale status &>/dev/null; then
    echo "tailscale" || true
    exit 0
fi

# Check for Mullvad status using Mullvad CLI
if mullvad status | grep -q "Connected"; then
    echo "mullvad" || true
    exit 0
fi

# Neither Tailscale nor Mullvad is connected
echo "none"
exit 0
