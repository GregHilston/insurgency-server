output "service_name" {
  value = aws_ecs_service.main.name
}

output "cluster_name" {
  value = aws_ecs_cluster.main.name
}

output "aws_codebuild_project_image_builder_name" {
  value       = aws_codebuild_project.image_builder.name
  description = "Name of AWS Code Build project to be used to build Docker images remotely."
}
