terraform {
    backend "s3" {
        region         = "us-west-2"
        bucket         = "justin-training-bucket"
        key            = "training-samples/training2.tfstate"
        encrypt        = "true"
    }
}

module "s3_bucket" {
    source = "./terraform"

    region = var.region
    env = var.env
    owner = var.owner
    project_prefix = var.project_prefix
    s3_bucket_name = var.s3_bucket_name
    create_s3_bucket = var.create_s3_bucket
}