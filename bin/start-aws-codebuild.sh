#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

aws codebuild create-webhook --project-name=${aws_codebuild_project.image_builder.name}
