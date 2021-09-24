data "local_file" "foo" {
    filename = "${path.module}/name_tag.txt"
}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "main" {
  bucket = "${data.aws_caller_identity.current.account_id}-tf-rds"
  acl    = "private"

  tags = {
    Name        = file(data.local_file.foo)
    Environment = "Dev"
  }
}
