#!/bin/bash -eux
set -o pipefail

pushd subject

  ci/lint/setup || true
  ci/lint/lint

popd
