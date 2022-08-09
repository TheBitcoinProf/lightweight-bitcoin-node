set -ex

VERSION=$(cat VERSION)
echo "Releasing version $VERSION ......"

./dockerBuild.sh

IMAGENAME=lightweight-bitcoin-node
USERNAME=thebitcoinprof

git tag -a "$VERSION" -m "Version $VERSION"
git push --tags

docker tag ${USERNAME}/${IMAGENAME}:latest ${USERNAME}/${IMAGENAME}:"${VERSION}"

docker push ${USERNAME}/${IMAGENAME}:latest
docker push ${USERNAME}/${IMAGENAME}:"${VERSION}"