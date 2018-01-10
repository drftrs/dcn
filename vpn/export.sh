#!/bin/bash

VPN_USER=${VPN_USER:-core}
VPN_HOST=${VPN_HOST:-vpn.drft.rs}

set -e

ssh $VPN_USER@$VPN_HOST <<EOF
docker run -v ovpn-data:/etc/openvpn -v /tmp:/backup --rm busybox tar -czf /backup/ovpn-data.tgz -C /etc openvpn
EOF

scp $VPN_USER@$VPN_HOST:/tmp/ovpn-data.tgz .

ssh $VPN_USER@$VPN_HOST <<EOF
sudo rm -rf /tmp/ovpn-data.tgz
EOF

tar -xzf ovpn-data.tgz -C etc
rm ovpn-data.tgz
