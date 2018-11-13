#!/bin/bash -eux
set -o pipefail

pushd "src/${HUGO_ROOT_REL}"

  hugo

popd

cp -R src/. mutated/
