resource "aws_s3_bucket" "terraform_bucket" {
  bucket = "alfaco-labs"

  tags = {
    Name        = "terraform"
    Environment = "all"
    Project = "labs"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.terraform_bucket.id
  acl    = "private"
}