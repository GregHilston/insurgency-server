#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Create the infrastructure
bin/terraform apply -auto-approve
