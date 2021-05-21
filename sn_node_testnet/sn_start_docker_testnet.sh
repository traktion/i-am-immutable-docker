#!/bin/bash

# IMPORTANT: This is experimental and does not currently work!

NODE_DIR="/home/safe/.safe/node/"
#FIRST_IP=`awk 'END{print $1}' /etc/hosts`
FIRST_IP="127.0.0.1"
FIRST_PORT=12305
NEXT_PORT=$((FIRST_PORT+1))
FIRST="${FIRST_IP}:${FIRST_PORT}"
REMOTE_IP=${FIRST_IP}

#${NODE_DIR}sn_node --local-addr ${FIRST_IP}:${FIRST_PORT} --public-addr ${REMOTE_IP}:${FIRST_PORT} --first ${FIRST} --root-dir ${NODE_DIR}testnet/root_dir/ --verbose --skip-igd --log-dir ${NODE_DIR}/testnet/root_dir/ &
${NODE_DIR}sn_node --first ${FIRST} --root-dir ${NODE_DIR}testnet/root_dir/ --verbose --skip-igd --log-dir ${NODE_DIR}/testnet/root_dir/ &
echo "Started node 1 (genesis) on ${REMOTE_IP}:${FIRST_PORT}"
sleep 1

for X in 2 3 4 5 6 7 8 9 10 11
do
	#${NODE_DIR}sn_node --local-addr ${FIRST_IP}:${NEXT_PORT} --public-addr ${REMOTE_IP}:${NEXT_PORT} --root-dir ${NODE_DIR}testnet/root_dir${X}/ --verbose --skip-igd --hard-coded-contacts=[\"${FIRST}\"] --log-dir ${NODE_DIR}testnet/root_dir${X}/ &
	${NODE_DIR}sn_node --root-dir ${NODE_DIR}testnet/root_dir${X}/ --verbose --skip-igd --hard-coded-contacts=[\"${FIRST}\"] --log-dir ${NODE_DIR}testnet/root_dir${X}/ &
	echo "Started node ${X} on ${REMOTE_IP}:${NEXT_PORT}"
	sleep 1
	NEXT_PORT=$((NEXT_PORT+1))
done

echo "Press [CTRL+C] to stop.."
while true
do
	sleep 1
done
