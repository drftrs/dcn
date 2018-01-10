#!/bin/bash

DNS_USER=${DNS_USER:-core}
DNS_HOST=${DNS_HOST:-vpn.drft.rs}

set -e

ssh $DNS_USER@$DNS_HOST <<EOF
docker kill dns
docker rm dns
EOF
