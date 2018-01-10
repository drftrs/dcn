#!/bin/bash

VPN_USER=${VPN_USER:-core}
VPN_HOST=${VPN_HOST:-vpn.drft.rs}
VOLUME_NAME=ovpn-data

set -e

rm -rf ovpn-data.tgz
tar -czf ovpn-data.tgz -C etc openvpn
scp ovpn-data.tgz $VPN_USER@$VPN_HOST:/tmp/ovpn-data.tgz
rm -rf ovpn-data.tgz

ssh $VPN_USER@$VPN_HOST <<EOF
docker run -v /tmp:/backup -v ovpn-data:/etc/openvpn:rw --rm busybox tar -xzf /backup/ovpn-data.tgz -C /etc
EOF

ssh $VPN_USER@$VPN_HOST <<EOF
rm -rf /tmp/ovpn-data.tgz
EOF
