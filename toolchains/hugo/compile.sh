#!/bin/sh -eux
set -o pipefail

cd "src/${HUGO_ROOT_REL}"

  hugo

cd -

cp -R src/. mutated/
