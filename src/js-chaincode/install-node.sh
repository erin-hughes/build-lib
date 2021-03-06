#!/usr/bin/env bash

echo "######## Begin install and configure Node ########"
export NVM_DIR=/home/pipeline/nvm

mkdir -p $NVM_DIR

echo "######## Installing Node.js version ${NODE_VERSION} using nvm ${NVM_VERSION} ########"
# Can safely ignore nvm.sh since it's not ours
# shellcheck disable=SC1090
npm config delete prefix \
  && curl "https://raw.githubusercontent.com/creationix/nvm/v${NVM_VERSION}/install.sh" | bash \
  && . $NVM_DIR/nvm.sh \
  && nvm alias default "$NODE_VERSION" \
  && nvm use default \
  && node -v \
  && npm -v

