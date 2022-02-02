variable "region" {
  description = "The region the VPC is in"
  type        = string
  default     = "us-east-1"
}

variable "env" {
  default = "dev"
}

variable "owner" {
  default = "tf.samples@armory.io"
}

variable "project_prefix" {
  default = "alc-tf-samples"
}

# set this to false if you want the local values defined below to be fixed
variable "add_suffix" {
  description = "Add random suffix to all generated resources?"
  type = bool
  default = true
}

# locals are usually derived variables
# change if this needs to be a fixed value
# also set variable.add_suffix to false
locals {
  s3_bucket_name         = "${var.project_prefix}-${var.env}-bucket"
}

variable "create_s3_bucket" {
  type = bool
  default = true
}
