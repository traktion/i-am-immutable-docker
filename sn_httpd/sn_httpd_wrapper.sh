#!/bin/sh

if [ -z $1 ]; then
  export NETWORK_CONTACT=`curl -sSL https://sn-testnet.s3.eu-west-2.amazonaws.com/alpha-punch-network-contacts | head -1`;
else
  export NETWORK_CONTACT=$1;
fi

if [ -z $2 ]; then
  export DNS_REGISTER="6d70bf50aec7ebb0f1b9ff5a98e2be2f9deb2017515a28d6aea0c6f80a9f44ddaf480334bbff0cd23302b386bfc071a51d132e8e13055701a94211eaada0b6b4c37a94f8adc1e96be1aa1f149b7faffa";
else
  export DNS_REGISTER=$2;
fi

export SAFE_PEERS=/ip4/142.93.46.42/udp/43338/quic-v1/p2p/12D3KooWSaCWsF2qLULtKTtjJPYpzCKn3X3aY19WdznPB5jUfmt3
safe wallet get-faucet 209.97.185.196:8000

sn_httpd 0.0.0.0:8080 static $NETWORK_CONTACT $DNS_REGISTER
