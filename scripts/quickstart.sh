
echo "Downloading latest version of the pruned blockchain..."

curl -L -o /tmp/blockchain.zip https://prunednode.today/latest.zip
unzip /tmp/blockchain.zip

mv blocks chainstate /data/

rm -f /tmp/blockchain.zip