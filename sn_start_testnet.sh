#!/bin/sh

# Starts a local test network with genesis node at 127.0.0.1:12305

NODE_DIR="${HOME}/.safe/node/"
FIRST_IP="127.0.0.1"
FIRST_PORT=12305
NEXT_PORT=$((FIRST_PORT+1))
FIRST="${FIRST_IP}:${FIRST_PORT}"

${NODE_DIR}sn_node --first ${FIRST} --root-dir ${NODE_DIR}testnet/root_dir/ --verbose --log-dir ${NODE_DIR}/testnet/root_dir/ &
echo "Started node 1 (genesis) on ${FIRST_IP}:${FIRST_PORT}"
sleep 1

for X in 2 3 4 5 6 7 8 9 10 11
do
	${NODE_DIR}sn_node --root-dir ${NODE_DIR}testnet/root_dir${X}/ --verbose --hard-coded-contacts=[\"${FIRST}\"] --log-dir ${NODE_DIR}testnet/root_dir${X}/ &
	echo "Started node ${X} on ${FIRST_IP}:${NEXT_PORT}"
	sleep 1
	NEXT_PORT=$((NEXT_PORT+1))
done
