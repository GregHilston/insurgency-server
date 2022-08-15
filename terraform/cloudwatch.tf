resource "aws_cloudwatch_log_group" "insurgency_server" {
  name = "${local.service_name}-Logs"
}
