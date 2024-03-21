#!/bin/sh

# Starts a local test network with genesis node at 127.0.0.1:12305

BIN_DIR="${HOME}/.local/bin/"
FIRST_IP="127.0.0.1"
FIRST_PORT=12305
NEXT_PORT=$((FIRST_PORT+1))
FIRST="${FIRST_IP}:${FIRST_PORT}"

${BIN_DIR}safenode --first ${FIRST}
echo "Started node 1 (genesis) on ${FIRST_IP}:${FIRST_PORT}"
sleep 1

for X in 2 3 4 5 6 7 8 9 10 11
do
	${BIN_DIR}safenode --hard-coded-contacts=[\"${FIRST}\"] &
	echo "Started node ${X} on ${FIRST_IP}:${NEXT_PORT}"
	sleep 1
	NEXT_PORT=$((NEXT_PORT+1))
done
