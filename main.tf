data "aws_caller_identity" "current" {}
resource "aws_s3_bucket" "main" {
  bucket = "${data.aws_caller_identity.current.account_id}-tf-rds"
  acl    = "private"

  tags = {
    Name        = file("${path.module}/name_tag.txt")
    Environment = "Dev"
  }
}
