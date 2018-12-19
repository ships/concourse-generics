#!/bin/bash -eux
set -o pipefail

pushd subject

  ci/unit-tests/setup || true
  ci/unit-tests/test ${RUN_SCRIPT_ARGS:-}
  ci/unit-tests/teardown || true

popd
