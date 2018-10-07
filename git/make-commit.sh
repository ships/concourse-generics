#!/bin/bash -eux
set -o pipefail

rm -rf out

if [ -d committer-info-passthrough ]; then
  GIT_AUTHOR_NAME="$(cat committer-info-passthrough/author_name)"
  GIT_AUTHOR_EMAIL="$(cat committer-info-passthrough/author_email)"
  SUBJECT="$(cat committer-info-passthrough/subject)"
  GIT_COMMITTER_NAME=$COMMITTER_NAME
  GIT_COMMITTER_EMAIL=$COMMITTER_EMAIL
else
  GIT_AUTHOR_NAME=$COMMITTER_NAME
  GIT_AUTHOR_EMAIL=$COMMITTER_EMAIL
fi

set -o nounset
echo "
making commit:
subject: $SUBJECT
message: $EXTRA_MESSAGE_DETAILS
"

function commit() {

  git add -A .
  git commit -v -m "$SUBJECT

  $EXTRA_MESSAGE_DETAILS"
}

function commit_recursive() {
  if [ $SUBMODULES ] && [ ! -z "$(git status -s)" ]; then
    git submodule foreach commit-recursive
  else
    commit
  fi
}

pushd "src"
  commit-recursive
popd

cp -r src out
