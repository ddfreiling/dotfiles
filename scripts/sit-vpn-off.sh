#!/bin/bash

set -e

# Copy over disabled always-on VPN profile.
sudo cp ~/dotfiles/scripts/SIT-REMOTE-OFF.xml /opt/cisco/secureclient/vpn/profile/ALWAYS-ON-ANYCONNECT.xml

# Kill the client and disconnect the running VPN connection
killall "Cisco AnyConnect Secure Mobility Client"
sleep 1
/opt/cisco/secureclient/bin/vpn disconnect

# Start a fresh AnyConnect client to load the new profile.
sleep 1
open "/Applications/Cisco/Cisco AnyConnect Secure Mobility Client.app"
