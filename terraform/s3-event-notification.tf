resource "aws_s3_bucket" "bucket" {
  bucket = "kthamel-infrastructure-events"
}

resource "aws_lambda_permission" "allow_s3" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.infrastructure-application-01.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.bucket.arn
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.bucket.bucket

  lambda_function {
    events        = ["s3:ObjectCreated:*"]
    filter_prefix = "" # Optional: Prefix of the object key for filtering events
    filter_suffix = "" # Optional: Suffix for filtering events

    lambda_function_arn = aws_lambda_function.infrastructure-application-01.arn
  }

  depends_on = [aws_lambda_permission.allow_s3]
}
