#!/bin/sh

if [ -z $1 ]; then
  export NETWORK_CONTACT="https://sn-testnet.s3.eu-west-2.amazonaws.com/network-contacts";
else
  export NETWORK_CONTACT=$1;
fi

if [ -z $2 ]; then
  export DNS_REGISTER="6d70bf50aec7ebb0f1b9ff5a98e2be2f9deb2017515a28d6aea0c6f80a9f44dda43d61a01fd64bc32265b41842ad4c8ef51b22748de068f550e39ebf88495a3e99c4481019d10ad513d0157fb2e679b3";
else
  export DNS_REGISTER=$2;
fi

#export SAFE_PEERS=/ip4/178.128.34.57/udp/42231/quic-v1/p2p/12D3KooWSn9FhKHBbTRuS9FfydrfQ17tGGDByW6SJiSMeW3Gogdo
#safe wallet get-faucet 209.97.185.196:8000

# silence logs
export RUST_LOG="info,sn_httpd=info,sn_api=warn,sn_client=warn,sn_networking=off"

sn_httpd 0.0.0.0:8080 static $NETWORK_CONTACT $DNS_REGISTER
