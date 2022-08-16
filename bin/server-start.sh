#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Loads .env
source "./.env"

# --raw ensures that the terraform output is not wrapped in quotes for string representation
cluster_name=$(./bin/terraform.sh output --raw cluster_name)
service_name=$(./bin/terraform.sh output --raw service_name)

# Scale the service up to get a task running
aws ecs update-service --cluster $cluster_name --service $service_name \
    --desired-count 1 > /dev/null

# Poll ECS to get the running task ARN
task=""
while [ "$task" = "" ]; do
    task=$(aws ecs list-tasks --cluster $cluster_name \
        --service-name $service_name | jq -r '.taskArns[]')

    test "$task" = "" && sleep 6
done

# Poll ECS until the task is up & running
aws ecs wait tasks-running --cluster "$cluster_name" --tasks "$task"

# Describe the running task
network_interface=$(aws ecs describe-tasks --cluster $cluster_name \
    --tasks "$task" | jq -r '.tasks[].attachments[] |
    select(.type == "ElasticNetworkInterface")
    .details[] | select(.name == "networkInterfaceId") .value')

# Get the IP address from this network interface
public_ip=$(aws ec2 describe-network-interfaces  \
    --filters Name=network-interface-id,Values="$network_interface" | \
    jq -r '.NetworkInterfaces[].Association.PublicIp')

echo "Server started successfully"
echo "Public IP address: $public_ip"
