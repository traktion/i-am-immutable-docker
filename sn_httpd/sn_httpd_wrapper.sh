#!/bin/sh

if [ -z $1 ]; then
  export NETWORK_CONTACT="https://sn-testnet.s3.eu-west-2.amazonaws.com/network-contacts";
else
  export NETWORK_CONTACT=$1;
fi

if [ -z $2 ]; then
  export DNS_REGISTER="6d70bf50aec7ebb0f1b9ff5a98e2be2f9deb2017515a28d6aea0c6f80a9f44dd80633b8c86c8c01bea9fde36344bd2461c72bdc8ef02273c647436a55e0ef84b850dd45c14bddfbe1c35b405c6213f5b";
else
  export DNS_REGISTER=$2;
fi

#export SAFE_PEERS=/ip4/178.128.34.57/udp/42231/quic-v1/p2p/12D3KooWSn9FhKHBbTRuS9FfydrfQ17tGGDByW6SJiSMeW3Gogdo
#safe wallet get-faucet 209.97.185.196:8000

# silence logs
export RUST_LOG="info,sn_httpd=info,ant_api=warn,ant_client=warn,ant_networking=off,ant_bootstrap=error"

sn_httpd 0.0.0.0:8080 static $NETWORK_CONTACT $DNS_REGISTER
