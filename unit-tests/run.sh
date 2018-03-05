#!/bin/bash -euxo pipefail

pushd subject

  ci/unit-tests/setup || true
  ci/unit-tests/test
  ci/unit-tests/teardown || true

popd
