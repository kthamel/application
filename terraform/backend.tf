terraform {
  backend "s3" {
    bucket = "kthamel-automation"
    key    = "infrastructure-application"
    region = "us-east-1"
  }
}
