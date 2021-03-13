provider "aws" {
  region  = var.region
}

terraform {
  required_version = ">= 0.14.0"
  required_providers {
    aws = ">= 3.18"
  }

  backend "s3" {
    bucket         = "terraform-practice"
    key            = "ec2-instance/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform_practice_lock"
  }
}