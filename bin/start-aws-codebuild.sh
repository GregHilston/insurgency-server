#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Ensures no output from pushd
pushd () {
    command pushd "$@" > /dev/null
}

# Ensures no output from pop
popd () {
    command popd "$@" > /dev/null
}

pushd ../terraform
AWS_CODEBUILD_PROJECT_IMAGE_BUILDER_NAME=$(terraform output --raw aws_codebuild_project_image_builder_name)
popd

 aws codebuild start-build --project-name $AWS_CODEBUILD_PROJECT_IMAGE_BUILDER_NAME
