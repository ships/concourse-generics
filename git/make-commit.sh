#!/bin/bash -eux
set -o pipefail

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

export SUBJECT EXTRA_MESSAGE_DETAILS

function commit() {
  if [ ! -z "$(git status -s)" ]; then
    git add -A .
    git commit -v -m "$SUBJECT

    $EXTRA_MESSAGE_DETAILS"
  fi
}

export -f commit

pushd "src"
  git submodule foreach --recursive | tac | sed -e s/Entering//g -e s/\'//g | xargs -I% cd % ; commit
popd

cp -R src/. out/
