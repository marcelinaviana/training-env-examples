module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  version = "1.25.0"


  bucket = "test-bucket-austin"
  acl    = "private"

  versioning = {
    enabled = false
  }
  
  server_side_encryption_configuration = {
    rule  = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    env   = "dev"
    owner = "austin"
  }
}

data "aws_s3_bucket" "selected" {
  depends_on = [ module.s3_bucket ]

  bucket = "test-bucket-austin"
}

output "s3bucket" {
  value = data.aws_s3_bucket.selected.id
}
