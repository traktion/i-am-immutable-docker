# sn-httpd-docker

## What is this?

sn_httpd web container: https://github.com/traktion/sn_httpd

## Configuration

You can either pull the latest image from Docker Hub:

`docker pull traktion/sn_httpd:latest`

Or build your own:

`docker build -t traktion/sn_httpd .`

Then run with:

`docker run -p 0.0.0.0:8080:8080 traktion/sn_httpd`

## Notes

There is an experimental Dockerfile in safenode_local_net too (which most can ignore). That bit doesn't work yet (binding/exposing ports is the issue).
