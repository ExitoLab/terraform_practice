provider "aws" {
  region = var.region
}

terraform {
  required_version = ">= 0.14.0"
  required_providers {
    aws = ">= 3.18"
  }
}