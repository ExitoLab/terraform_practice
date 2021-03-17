module "common_labels" {
  source = "git::https://github.com/cloudposse/terraform-null-label.git?ref=0.24.1"

  tags = {
    "business_unit" = "Technology",
    "region"        = "eu-west-1",
    "department"    = "Technology"
  }
}