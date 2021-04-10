module "common_labels" {
    source = "git::https://github.com/cloudposse/terraform-null-label.git?ref=0.24.1"
    tags = {
        "Business unit" = "Technology",
        "Region"        = "eu-west-1",
        "Department"    = "Technology",
        "Owner"         = "Technology",
        "Environment"   = "production"
    }
}