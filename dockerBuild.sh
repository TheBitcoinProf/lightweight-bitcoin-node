set -ex

BITCOIN_CORE_VERSION=$(cat BITCOIN_CORE_VERSION)
IMAGENAME=lightweight-bitcoin-node
USERNAME=thebitcoinprof

sudo docker build --build-arg bitcoinCoreVersion=$BITCOIN_CORE_VERSION -t ${USERNAME}/${IMAGENAME} ./