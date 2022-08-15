data "aws_caller_identity" "current" {}

resource "aws_codebuild_project" "image_builder" {
  name = "${local.service_name}-ImageBuilder"
  description  = "This is responsible for building the Insurgency Docker image and pushing it to ECR"
  service_role = "${aws_iam_role.codebuild.arn}"

  # Time in minutes
  build_timeout = "30"

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image = "aws/codebuild/docker:18.09.0"
    type = "LINUX_CONTAINER"
    # This is now required for AWS provided Docker images
    privileged_mode = true

    environment_variable {
      name  = "AWS_DEFAULT_REGION"
      value = "${var.aws_region}"
    }

    environment_variable {
      name  = "AWS_ACCOUNT_ID"
      value = "${data.aws_caller_identity.current.account_id}"
    }

    environment_variable {
      name  = "IMAGE_REPO_NAME"
      value = "${aws_ecr_repository.main.name}"
    }

    environment_variable {
      name  = "IMAGE_TAG"
      value = "latest"
    }
  }

  source {
    type = "GITHUB"
    location = "${var.github_repo}"
  }
}
