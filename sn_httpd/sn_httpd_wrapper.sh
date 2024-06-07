#!/bin/sh

if [ -z $1 ]; then
  export NETWORK_CONTACT=`curl -sSL https://sn-testnet.s3.eu-west-2.amazonaws.com/network-contacts | head -1`;
else
  export NETWORK_CONTACT=$1;
fi

if [ -z $2 ]; then
  export DNS_REGISTER="6d70bf50aec7ebb0f1b9ff5a98e2be2f9deb2017515a28d6aea0c6f80a9f44dd8128aad4427271f22b4f1444119b3243adbd5c48ca15edd7ab3dd56e4017a82126a4d2b5fe49d53fcfac7beef03f748e";
else
  export DNS_REGISTER=$2;
fi

export SAFE_PEERS=/ip4/178.128.34.57/udp/42231/quic-v1/p2p/12D3KooWSn9FhKHBbTRuS9FfydrfQ17tGGDByW6SJiSMeW3Gogdo
#safe wallet get-faucet 209.97.185.196:8000

sn_httpd 0.0.0.0:8080 static $NETWORK_CONTACT $DNS_REGISTER
