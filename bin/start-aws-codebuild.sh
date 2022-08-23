#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

pushd ../terraform
AWS_CODEBUILD_PROJECT_IMAGE_BUILDER_NAME=$(terraform output --raw aws_codebuild_project_image_builder_name)
popd
echo $AWS_CODEBUILD_PROJECT_IMAGE_BUILDER_NAME

aws codebuild create-webhook --project-name $AWS_CODEBUILD_PROJECT_IMAGE_BUILDER_NAME

