terraform {
  required_version = ">= 0.13.1, < 0.15.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.49"
    }
  }
}