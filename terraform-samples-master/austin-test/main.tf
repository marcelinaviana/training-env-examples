module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  version = "1.25.0"


  bucket = "test-bucket-austin"
  acl    = "private"

  versioning = {
    enabled = false
  }

  tags = {
    env   = "dev"
    owner = "austin"
  }
}
