#!/bin/bash

RPC_USERNAME="satoshi"
CONF_FILE=/conf/pruned-bitcoin.conf

while getopts u: flag
do
    case "${flag}" in
        u) RPC_USERNAME=${OPTARG};;
    esac
done

echo "Generating a password for RPC User ${RPC_USERNAME}..."
result=$(python3 /scripts/rpcauth.py $RPC_USERNAME)
configLine=$(echo "${result}" | grep rpcauth)
password=$(echo "${result}" | grep -A 1 "Your password" | tail -1)

sed -i "s/^rpcauth=.*/${configLine}/g" $CONF_FILE

cat $PASSWORD_FILE

echo "The password is:"
echo $password
echo "This password will not be displayed again"
echo "Save this password in a secure location to be able to connect to your Bitcoin node"