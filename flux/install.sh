#!/bin/bash

set -e
set -o pipefail

FLUX_HOME=$(echo $HOME/.flux/bin)
mkdir -p $FLUX_HOME

curl -s https://fluxcd.io/install.sh | bash -s -- "$FLUX_HOME"

export PATH=$PATH:$FLUX_HOME

flux check --pre
flux install
