#!/bin/bash

aws codebuild create-webhook --project-name=${aws_codebuild_project.image_builder.name}
