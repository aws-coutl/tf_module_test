data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "main" {
  bucket = "${data.aws_caller_identity.current.account_id}-tf-rds"
  acl    = "private"

  tags = {
    Name        = var.file_location
    Environment = "Dev"
  }
}

variable "file_location" {}
