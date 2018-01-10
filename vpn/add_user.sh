#!/bin/bash

VPN_USER=${VPN_USER:-core}
VPN_HOST=${VPN_HOST:-vpn.drft.rs}
NEW_USER=$1

set -e

docker run -v $PWD/etc/openvpn:/etc/openvpn --rm -it kylemanna/openvpn easyrsa build-client-full $NEW_USER nopass
docker run -v $PWD/etc/openvpn:/etc/openvpn --rm kylemanna/openvpn ovpn_getclient $NEW_USER > $NEW_USER.ovpn
