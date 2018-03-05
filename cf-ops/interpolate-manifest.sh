#!/bin/bash -eux
set -o pipefail
build_root=$PWD


set +x
#dump creds to file, but don't display to task output
cat > /tmp/creds_file << ENDDOC
$CREDENTIALS_YAML
ENDDOC

set -x

# generate manifest
mkdir -p manifest
bosh int "${build_root}/${SOURCE_FILE}" > manifest/fleet.yml \
  --vars-file /tmp/creds_file

