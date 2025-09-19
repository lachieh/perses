#!/bin/bash

## /!\ This file must be used from within the perses project
## This script automates the steps for running the api backend server during
## development.

WORKSPACE_ROOT=$(git rev-parse --show-toplevel)

echo ">> build the api server"
make -C "${WORKSPACE_ROOT}" build-api

# if [[ $1 == "--e2e" ]]; then
#   # deactivate the permission because e2e tests doesn't support yet the JWT cookies
#   previous_file="${WORKSPACE_ROOT}/dev/config.previous.yaml"
#   config_file="${WORKSPACE_ROOT}/dev/config.yaml"
#   cp "${config_file}" "${previous_file}"
#   sed 's/enable_auth: true/enable_auth: false/g' "${previous_file}" >"${config_file}"
#   rm "${previous_file}"
# fi

# Run backend server
echo ">> start the api server"
echo '>> Log in with user: "admin" and password: "password"'
"${WORKSPACE_ROOT}"/bin/perses --config "${WORKSPACE_ROOT}"/dev/config.yaml --log.level=debug
