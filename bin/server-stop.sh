#!/bin/bash

# Loads .env
# shellcheck disable=2039 disable=1091
source "./.env"

cluster_name=$(bin/terraform.sh output --raw cluster_name)
service_name=$(bin/terraform.sh output --raw service_name)

# Scale down so we stop the service
aws ecs update-service --cluster $cluster_name --service $service_name \
    --desired-count 0 > /dev/null

echo "Server is being stopped"

