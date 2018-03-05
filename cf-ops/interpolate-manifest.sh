#!/bin/bash -eux
set -o pipefail
build_root=$PWD


#dump creds to file, but don't display to task output
mkdir -p /tmp/cred_files

set +x
cat > /tmp/creds_files/apns << ENDDOC
$CREDENTIALS_YAML
ENDDOC

set -x

# generate manifest
mkdir -p manifest
bosh int "${build_root}/${SOURCE_FILE}" > manifest/fleet.yml \
  --vars-from /tmp/creds_file

