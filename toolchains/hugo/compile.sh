#!/bin/bash -eux
set -o pipefail

rm -rf out

pushd "src/${HUGO_ROOT_REL}"

  hugo

popd

cp -r src mutated
