# //////////////////////////////
# VARIABLES
# //////////////////////////////

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "The region of the aws account"
}

variable "bucket_name" {
  type        = string
  default     = "terraform-example.com"
  description = "The is the bucket name"
}

variable "domain_name" {
  type        = string
  default     = "terraform-example.com"
  description = "The is the bucket name"
}