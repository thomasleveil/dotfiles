#!/bin/bash
set -e
set -u
set -o pipefail


# See http://stackoverflow.com/a/246128/107049
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"


if [[ $# -lt 1 ]]; then
  echo "USAGE: $(basename $0) <archive file>"
  exit 1
fi

FICHIER_ARCHIVE=$1

if ! [[ -f "$FICHIER_ARCHIVE" ]]; then
  echo "$FICHIER_ARCHIVE is not a file"
  exit 1
fi

ABS_FICHIER_ARCHIVE=$(readlink -f $FICHIER_ARCHIVE)


# compute archive file sha1 
EXPECTED_SHA=$(sha1sum "${ABS_FICHIER_ARCHIVE}" | cut -c -10)

if [[ $# -lt 2 ]]; then
  echo "To confirm the load of file \"$ABS_FICHIER_ARCHIVE\", repeat your command appending the following confirmation code: \"$EXPECTED_SHA\""
  exit 2
fi

ACTUAL_SHA=$2

# provided sha validation
if [[ "$EXPECTED_SHA" != "$ACTUAL_SHA" ]]; then
  echo "incorrect confirmation code"
  exit 1
fi

cd "${DIR}/.."
exec cat "$ABS_FICHIER_ARCHIVE" | docker-compose exec -T db mongorestore --archive 

