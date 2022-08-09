#!/bin/bash

CONF_FILE=/conf/pruned-bitcoin.conf

rpcAuthLine=$(grep ^rpcauth= $CONF_FILE)

if [[ $rpcAuthLine == *"AUTOGEN"* ]]; then
  /scripts/resetRpcPassword.sh
fi

if [[ -z "$(ls -A /data)" ]]; then
  /scripts/quickstart.sh
fi

bitcoind -conf=/conf/pruned-bitcoin.conf