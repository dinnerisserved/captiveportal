#!/bin/bash

# Function to get the current active Wi-Fi connection name
get_active_wifi_name() {
    nmcli -t -f active,ssid dev wifi | grep '^yes:' | cut -d ':' -f2
}

# Function to get the Wi-Fi device name
get_wifi_device() {
    nmcli -t -f DEVICE,TYPE dev | grep ':wifi$' | cut -d ':' -f1
}

# Function to deactivate and reactivate the network connection
reset_network() {
    local wifi_name=$1
    local wifi_device=$2

    # Turning off wifi and waiting for it to turn off
    nmcli radio wifi off
    sleep 5

    # Turning on wifi and waiting for it to turn on
    nmcli radio wifi on
    sleep 5

    # Disconnecting from the network
    nmcli device disconnect "$wifi_device"
    sleep 5

    # Reconnecting to the network
    nmcli device wifi connect "$wifi_name" ifname "$wifi_device"
    sleep 10
}

# Main Script Execution
echo "Starting Captive Portal Script (Root Part)..."

# Getting the active WiFi network name and device
network_name=$(get_active_wifi_name)
wifi_device=$(get_wifi_device)

if [ -z "$network_name" ] || [ -z "$wifi_device" ]; then
    echo "No active Wi-Fi connection or device found."
    exit 1
fi

echo "Active Wi-Fi Network: $network_name"
echo "Wi-Fi Device: $wifi_device"

# Stopping firewall
echo "Stopping and disabling firewall..."
ufw disable

# Resetting network
reset_network "$network_name" "$wifi_device"

# Enabling firewall
echo "Firewall is active and enabled on system startup"
ufw enable

# Set the username of the non-root user
regular_user=$(logname)

# Attempt to get the DBUS_SESSION_BUS_ADDRESS environment variable
DBUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$(pgrep -u "$regular_user" gnome-session | head -n 1)/environ 2>/dev/null | tr -d '\0')

if [ -z "$DBUS_ADDRESS" ]; then
    DBUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /home/$regular_user/.dbus/session-bus/$(cat /var/lib/dbus/machine-id)-0 2>/dev/null | tr -d '\0')
fi

if [ ! -z "$DBUS_ADDRESS" ]; then
    export DBUS_SESSION_BUS_ADDRESS="$DBUS_ADDRESS"
else
    echo "Could not find DBUS_SESSION_BUS_ADDRESS for user $regular_user."
    exit 1
fi

echo "Root-level tasks completed."
echo "Please run the user-level script: ./captiveportal_user.sh"

