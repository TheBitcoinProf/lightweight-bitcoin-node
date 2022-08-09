FROM debian:bookworm

ARG bitcoinCoreVersion

RUN mkdir /conf /data /scripts /auth

COPY ./presetBitcoinConfigs/ /conf/

COPY ./scripts/* /scripts/

RUN chmod +x /scripts/*

RUN apt update && apt install -y python3 curl unzip

ADD "https://raw.githubusercontent.com/bitcoin/bitcoin/master/share/rpcauth/rpcauth.py" /scripts/rpcauth.py

ADD "https://bitcoincore.org/bin/bitcoin-core-$bitcoinCoreVersion/bitcoin-$bitcoinCoreVersion-x86_64-linux-gnu.tar.gz" /tmp/bitcoincore.tar.gz

WORKDIR /tmp

RUN tar -xvzf /tmp/bitcoincore.tar.gz \
    && mv bitcoin-$bitcoinCoreVersion/bin/* /bin/

CMD ["/bin/bash", "-c", "/scripts/init.sh"]