#!/bin/bash

VPN_USER=${VPN_USER:-core}
VPN_HOST=${VPN_HOST:-vpn.drft.rs}

set -e

ssh $VPN_USER@$VPN_HOST <<EOF
docker kill vpn && docker rm vpn
EOF
