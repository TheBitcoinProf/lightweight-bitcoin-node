
BITCOIN_CORE_VERSION=$(cat BITCOIN_CORE_VERSION)
IMAGENAME=lightweight-bitcoin-node

sudo docker build --build-arg bitcoinCoreVersion=$BITCOIN_CORE_VERSION -t $IMAGENAME ./
