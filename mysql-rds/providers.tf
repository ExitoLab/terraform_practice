provider "aws" {
  region = var.region
}

# terraform {

# #   backend "s3" {
# #     bucket         = "terraform-practice"
# #     key            = "ec2-instance/terraform.tfstate"
# #     region         = "us-east-1"
# #     encrypt        = true
# #     dynamodb_table = "terraform_practice_lock"

# #     skip_metadata_api_check     = true
# #     skip_region_validation      = true
# #     skip_credentials_validation = true
# #   }
# }