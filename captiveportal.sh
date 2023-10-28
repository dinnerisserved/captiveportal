#!/bin/bash

# Get current SSID
ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes:' | cut -d: -f2)

# Check if SSID is empty
if [ -z "$ssid" ]; then
    echo "No active Wi-Fi connection found."
    exit 1
fi

# Disconnect and reconnect
nmcli con down id "$ssid"
nmcli con up id "$ssid"

# Restart NetworkManager
sudo service NetworkManager restart

# Flush DNS cache
sudo systemctl restart systemd-resolved

# Disable firewall temporarily
sudo ufw disable

# Adjust proxy settings and force captive portal to open
gsettings set org.gnome.system.proxy mode 'none'
gsettings set org.gnome.system.proxy autoconfig-url ""

# Try opening an HTTP and an HTTPS site to trigger the captive portal
xdg-open http://example.com
xdg-open https://example.com

# Revert proxy settings
gsettings set org.gnome.system.proxy mode 'auto'
gsettings reset org.gnome.system.proxy autoconfig-url

# Trigger additional web requests
xdg-open http://neverssl.com
xdg-open https://google.com

# Re-enable firewall
sudo ufw enable
