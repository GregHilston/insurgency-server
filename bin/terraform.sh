#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# cd to root path
cd "$(dirname "$0")/.." || exit;

# Loads the .env
# shellcheck disable=2039 disable=1091
source "./.env"

# Run terraform
# shellcheck disable=2068
cd terraform && terraform $@
