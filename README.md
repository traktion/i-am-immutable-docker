# i-am-immutable-docker

## What is this?

I am IMMUTABLE blog app hosted in a web container.

I am IMMUTABLE app: https://github.com/traktion/i-am-immutable-client
sn_httpd web container: https://github.com/traktion/sn_httpd

## Configuration

You can either run a local test safe network or connect to a remote safe network.

To run locally, start a local test network at 127.0.0.1:12305:

`./sn_start_testnet.sh`

You can either pull the latest image from Docker Hub and run it:

`docker pull codiate/i-am-immutable:latest`
Local (Linux hosts only, currently): `docker run --network host -t codiate/i-am-immutable:latest 127.0.0.1:12305`
Remote (any platform hosts): `docker run --network host -t codiate/i-am-immutable:latest <Bootstrap IP:port>`

Or build your own:

`docker build . -t i-am-immutable`
Local (Linux hosts only, currently): `docker run --network host -t i-am-immutable 127.0.0.1:12305`
Remote (any platform hosts): `docker run --network host -t i-am-immutable <Bootstrap IP:port>`

## Notes

Note that for local networks you could use a `safe node run-baby-fleming`, but the start port is
randomised. This would require the container command to be updated to reflect the target port.

There is an experimental sn_node_testnet/Dockerfile too, but Docker doesn't seem to allow the ports
to connect at this time, even with `--network host` set (on Linux hosts). With more persistent efforts,
it may be possible to unlock this.
