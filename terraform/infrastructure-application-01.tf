resource "aws_lambda_function" "infrastructure-application-01" {
  function_name = "ProcessS3Event"
  s3_bucket     = "kthamel-infrastructure-application"
  s3_key        = "application-01.zip"
  handler       = "index.lambda_handler"
  runtime       = "python3.8"

  role = aws_iam_role.lambda_role.arn

  vpc_config {
    subnet_ids         = ["subnet-04a47e2c30f25cb4e", "subnet-0ab3ec16f86fb4b0e", "subnet-08c71031376dd09ff"]
    security_group_ids = [aws_security_group.Infrastructure_Application_SG.id]
  }
}
