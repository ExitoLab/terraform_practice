provider "aws" {
  region  = var.region
}

terraform {
  required_version = ">= 0.12.0, < 0.15.0"
  required_providers {
    aws = ">= 3.18"
  }
}