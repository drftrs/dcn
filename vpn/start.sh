#!/bin/bash

VPN_USER=${VPN_USER:-core}
VPN_HOST=${VPN_HOST:-vpn.drft.rs}

set -e

ssh $VPN_USER@$VPN_HOST <<EOF
docker run --name vpn -v ovpn-data:/etc/openvpn -d -p 1194:1194/udp --cap-add=NET_ADMIN kylemanna/openvpn
EOF
