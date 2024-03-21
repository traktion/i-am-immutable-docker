# i-am-immutable-docker

## What is this?

I am IMMUTABLE blog app hosted in a web container.

I am IMMUTABLE app: https://github.com/traktion/i-am-immutable-client
sn_httpd web container: https://github.com/traktion/sn_httpd

## Configuration

You can either pull the latest image from Docker Hub:

`docker pull codiate/i-am-immutable:latest`

Or build your own:

`docker build -t i-am-immutable .`

Then run using a Maidsafe remote node:

`docker run -p 127.0.0.1:8080:8080 i-am-immutable`

Or run using any node's quic URL:

`docker run -p 127.0.0.1:8080:8080 i-am-immutable /ip4/144.126.202.104/udp/51231/quic-v1/p2p/12D3KooWRmRtGAN2P2SW4uVpug6cc4wZ7GemTXTFvb9PC7LxXEWS`

## Notes

There is an experimental Dockerfile in safenode_local_net too (which most can ignore). That bit doesn't work yet (binding/exposing ports is the issue).
