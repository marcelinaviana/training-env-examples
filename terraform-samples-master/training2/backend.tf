terraform {
  required_version = ">= 0.12.0"

  backend "s3" {
    region         = "us-west-2"
    bucket         = "justin-training-bucket"
    key            = "training-samples/training2.tfstate"
    encrypt        = "true"
  }
}

# Chris testing fix
module "s3_bucket" {
  source = "./main.tf"
  s3_bucket_name = var.s3_bucket_name
}