terraform {
  required_version = ">= 0.12.0"

  backend "s3" {
    region         = "us-east-1"
    bucket         = "alc-tf-samples-state"
    key            = "public-samples/training.tfstate"
    dynamodb_table = "alc-tf-samples-state"
    encrypt        = "true"
  }
}
