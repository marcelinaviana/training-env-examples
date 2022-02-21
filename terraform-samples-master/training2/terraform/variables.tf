variable "region" {
  description = "The region the VPC is in"
  type        = string
}

variable "env" {
  type        = string
}

variable "owner" {
  type        = string
}

variable "project_prefix" {
  type        = string
}

variable "s3_bucket_name" {
  type = string
}

variable "create_s3_bucket" {
  type = bool
}
