#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Ensures no output from pushd
pushd () {
    command pushd -q "$@" > /dev/null
}

# Ensures no output from popd
popd () {
    command popd "$@" > /dev/null
}

pushd ../terraform
AWS_CODEBUILD_PROJECT_IMAGE_BUILDER_NAME=$(terraform output --raw aws_codebuild_project_image_builder_name)
popd

aws codebuild create-webhook --project-name $AWS_CODEBUILD_PROJECT_IMAGE_BUILDER_NAME

