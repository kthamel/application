resource "aws_security_group" "Infrastructure_Application_SG" {
  name        = "Infrastructure_Application_SG"
  vpc_id      = "vpc-017c27b1c58dc603c"
  description = "Allow Lambda to communicate within the VPC"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "ALL"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
