# Insurgency Server

This repository allows one to deploy an [Insurgency](https://store.steampowered.com/app/222880/Insurgency/) server to AWS.

## Local Machine Requirements

- AWS CLI
- Terraform
- jq

## Setup

1. Clone this repo
2. Install all dependencies (on Mac, use `$ brew install jq awscli terraform`)
3. Run `$ bin/bootstrap` and fill the variable as expected
4. Execute the additional steps asked
5. Push the repository to Github

## Deploying The AWS Cloud Resources

- `$ cd terraform`
- Set our environment variables: `$ source .env`
- Review the plan generated by: `$ terraform plan`
- If all looks good: `$ terraform apply`

## Tearing Down The AWS Cloud Resources

- `$ cd terraform`
- `$ terraform destroy`

## Running/stopping the server

> $ bin/server start

This command will start the server and output the IP address. It might take a
while (about 4 min).

> $ bin/server stop

Stops the server and you won't be charged on AWS.


