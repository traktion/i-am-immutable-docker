# i-am-immutable-docker

Docker container for i-am-immutable-client hosted by sn_httpd.

These instructions are for Linux hosts ONLY. More work is needed to improve platform support.

Start a local test network at 127.0.0.1:12305, to allow sn_httpd to connect to a known Safe Network
port.

`./sn_start_testnet.sh`

Build i-am-immutable container:

`docker build . -t i-am-immutable`

Start containers (Linux only, currently):

`docker run --network host -t i-am-immutable 127.0.0.1:12305`

Note that you could use a `safe node run-baby-fleming`, but the start port is randomised. This would
require the container command to be updated to reflect the target port.

There is an experimental sn_node_testnet/Dockerfile too, but Docker doesn't seem to allow the ports
to connect at this time, even with `--network host` set (on Linux hosts). With more persistent efforts,
it may be possible to unlock this.
