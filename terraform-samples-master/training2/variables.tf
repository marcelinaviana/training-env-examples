variable "region" {
  description = "The region the VPC is in"
  type        = string
  # default     = "us-east-1"
}

variable "env" {
  default = "dev"
}

variable "owner" {
  default = "tf.samples@armory.io"
}

variable "project_prefix" {
  default = "training"
}

variable "s3_bucket_name" {
  type = string
  # default = "training-dev-bucket"
}

variable "create_s3_bucket" {
  type = bool
  default = true
}
