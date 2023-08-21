#!/bin/bash

# Get current SSID 
ssid=$(nmcli -fields NAME,SSID connection show --active | egrep '^[a-zA-Z0-9-_]+' -o)

# Disconnect and reconnect
nmcli con down id "$ssid"
nmcli con up id "$ssid" 

# Restart NetworkManager
sudo service NetworkManager restart

# Flush DNS cache  
sudo /etc/init.d/dns-clean start

# Disable firewall temporarily
sudo ufw disable 

# Force captive portal to open
gsettings set org.gnome.system.proxy mode 'none'
gsettings set org.gnome.system.proxy autoconfig-url "http://example.com/captive"

# Open captive portal page 
xdg-open http://example.com  

# Revert proxy settings
gsettings set org.gnome.system.proxy mode 'auto'
gsettings reset org.gnome.system.proxy autoconfig-url

# Trigger web request
xdg-open http://example.com 

# Re-enable firewall
sudo ufw enable