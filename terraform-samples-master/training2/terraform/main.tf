
provider "aws" {
  region = var.region
}


resource "aws_s3_bucket" "bucket"{
  bucket = var.s3_bucket_name
  force_destroy = true
  tags = {
    env   = var.env
    owner = var.owner
  }
}

resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}


data "aws_s3_bucket" "selected" {
  depends_on = [aws_s3_bucket.bucket]
  bucket = var.s3_bucket_name
}


output "s3bucket" {
  value = data.aws_s3_bucket.selected.id
}
