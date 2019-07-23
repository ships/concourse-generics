#!/bin/bash -eux
set -o pipefail

pushd subject

  ci/audit/setup || true
  ci/audit/audit

popd
