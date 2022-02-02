# generate a random string with no special characters and use as suffix
resource "random_string" "suffix" {
  length  = 10
  upper   = false
  special = false
}

locals {
  s3_bucket_name_local = "%{ if var.add_suffix }${local.s3_bucket_name}-${random_string.suffix.id}%{ else }${local.s3_bucket_name}%{ endif }"
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  version = "1.25.0"

  create_bucket = var.create_s3_bucket

  bucket = local.s3_bucket_name_local
  acl    = "private"

  versioning = {
    enabled = true
  }

  server_side_encryption_configuration = {
    rule  = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    env   = var.env
    owner = var.owner
  }
}

data "aws_s3_bucket" "selected" {
  depends_on = [ module.s3_bucket ]

  bucket = local.s3_bucket_name_local
}

output "s3bucket" {
  value = data.aws_s3_bucket.selected.id
}
