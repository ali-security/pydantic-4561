#! /usr/bin/env bash

set -x
set -e

cd fastapi
git fetch --tags
latest_tag_commit=$(git rev-list --tags --max-count=1)
latest_tag=$(git describe --tags "${latest_tag_commit}")
git checkout "0.79.0"

pip install -U flit
pip install "flask<=2.2.2"
flit install

./scripts/test.sh
