resource "aws_s3_bucket" "terraform_bucket" {
  bucket = "alfaco-static-website"

  tags = {
    name        = "terraform"
    environment = "all"
    project = "labs"
    labs ="s3"
  }
  
}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.terraform_bucket.id 

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = "documents/"
    }
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.terraform_bucket.id 

  versioning_configuration {
    status = "Enabled"
  }
}
data "aws_canonical_user_id" "current" {}

resource "aws_s3_bucket_acl" "acl_bucket" {
  bucket = aws_s3_bucket.terraform_bucket.id
  
 access_control_policy {
    grant {
      grantee {
        id   = data.aws_canonical_user_id.current.id
        type = "CanonicalUser"
      }
      permission = "READ"
    }


    owner {
      id = data.aws_canonical_user_id.current.id
    }
  }


}