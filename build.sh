#!/bin/bash -e

# determine full version
BASE_VERSION="$(cat 'version' | xargs).${BUILD_NUMBER:-local}"
GIT_SHA=$(git rev-parse --short HEAD)
DIRTY=$([[ -z $(git status -s) ]] || echo '-dirty')
VERSION=${BASE_VERSION}-${GIT_SHA}${DIRTY}

docker build -t wagman .
docker run --rm \
-v `pwd`:/output/ -e VERSION=$VERSION wagman ./release.sh  
