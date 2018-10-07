#!/bin/bash -eux
set -o pipefail

build_root="$(pwd)"

out=$build_root/out

pushd src

  git show --format="%aN" | head -n1 > $out/author_name
  git show --format="%aE" | head -n1 > $out/author_email
  git show --format="%s" | head -n1 > $out/subject

popd
