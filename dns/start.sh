#!/bin/bash

DNS_USER=${DNS_USER:-core}
DNS_HOST=${DNS_HOST:-vpn.drft.rs}

set -e

ssh $DNS_USER@$DNS_HOST <<EOF
docker pull drftrs/dns:latest
docker run -d --name dns -p 53:53/tcp -p 53:53/udp --cap-add=NET_ADMIN drftrs/dns:latest
EOF
