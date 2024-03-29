#!/bin/sh

if [ -z $1 ]; then
  export NETWORK_CONTACT=`curl -sSL https://sn-testnet.s3.eu-west-2.amazonaws.com/network-contacts | head -1`;
else
  export NETWORK_CONTACT=$1;
fi

safe wallet get-faucet 188.166.171.13:8000

sn_httpd 0.0.0.0:8080 static $NETWORK_CONTACT
