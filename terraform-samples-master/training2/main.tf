# module "s3_bucket" {
#   source = "terraform-aws-modules/s3-bucket/aws"
#   version = "1.25.0"

#   create_bucket = var.create_s3_bucket

#   bucket = var.s3_bucket_name
#   acl    = "private"

#   versioning = {
#     enabled = false
#   }

#   server_side_encryption_configuration = {
#     rule  = {
#       apply_server_side_encryption_by_default = {
#         sse_algorithm = "AES256"
#       }
#     }
#   }

#   tags = {
#     env   = var.env
#     owner = var.owner
#   }
# }

# data "aws_s3_bucket" "selected" {
#   depends_on = [ module.s3_bucket ]

#   bucket = var.s3_bucket_name
# }

# output "s3bucket" {
#   value = data.aws_s3_bucket.selected.id
# }

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
