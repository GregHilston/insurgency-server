#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

docker build . -t insurgency-server
