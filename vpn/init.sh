#!/bin/bash

VPN_USER=${VPN_USER:-core}
VPN_HOST=${VPN_HOST:-vpn.drft.rs}

set -e

VOLUME_NAME=$(docker volume create)

# Generates server configuration
docker run -v $VOLUME_NAME:/etc/openvpn --rm kylemanna/openvpn ovpn_genconfig -u udp://$VPN_HOST

# Intiialize the private key infrastructure
docker run -it -v $VOLUME_NAME:/etc/openvpn --rm kylemanna/openvpn ovpn_initpki

# Export PKI to local tarball
docker run -v $VOLUME_NAME:/etc/openvpn -v $(pwd):/backup --rm busybox tar -czf /backup/ovpn-data.tgz -C /etc openvpn

docker volume rm $VOLUME_NAME

# Extract tarball
tar -xzf ovpn-data.tgz -C etc
rm ovpn-data.tgz
