#!/bin/sh

if [ -z $1 ]; then
  export NETWORK_CONTACT=`curl -sSL https://sn-testnet.s3.eu-west-2.amazonaws.com/network-contacts | head -1`;
else
  export NETWORK_CONTACT=$1;
fi

if [ -z $2 ]; then
  export DNS_REGISTER="6d70bf50aec7ebb0f1b9ff5a98e2be2f9deb2017515a28d6aea0c6f80a9f44dd8f1cddbfbd2d975b19912dfd01e3c02077470177455a47814002d5a0f30e886720cc892a3b31f69bf4dae3d2d455fe21";
else
  export DNS_REGISTER=$2;
fi

export SAFE_PEERS=/ip4/209.209.9.143/udp/4748/quic-v1/p2p/12D3KooWMQ8HJdgUmJvyT3WoGWb6RmadswniAQrsm7uZ3sKdpVsT
safe wallet get-faucet 52.213.146.192:8000

sn_httpd 0.0.0.0:8080 static $NETWORK_CONTACT $DNS_REGISTER
