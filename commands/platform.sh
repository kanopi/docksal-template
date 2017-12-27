#!/usr/bin/env bash

#: exec_target = cli

## Run project's Platform CLI command
##
## Usage: fin platform.sh [aruments]
##
set -e

SOURCE="${BASH_SOURCE[0]}"
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
. ${DIR}/helper_functions

if [ $1 == 'install' ]; then
  ## Install Terminus
  echo-green "Installing Platform.sh CLI Tool..."
  curl -sS https://platform.sh/cli/installer | php
else
  if [ command -v platform > /dev/null 2>&1 ]; then
    platform $*
  else
    echo-red "Platform.sh CLI not installed."
    echo-yellow "Run: fin platform.sh install"
    exit 1
  fi
fi
