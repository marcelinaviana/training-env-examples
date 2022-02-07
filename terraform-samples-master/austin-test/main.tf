resource "aws_s3_bucket" "test-bucket" {
  bucket = "my-tf-test-bucket"
  acl    = "private"
  region = "us-west-2"

  tags = {
    Name        = "test-bucket"
    Environment = "Dev"
  }
}
