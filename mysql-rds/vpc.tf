module "vpc" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-vpc.git?ref=v2.78.0"

  name = "vpc-mysql-rds"

  cidr = var.vpc_cidr

  azs              = ["${var.region}a", "${var.region}b", "${var.region}c"]
  public_subnets   = ["10.99.0.0/24", "10.99.1.0/24", "10.99.2.0/24"]
  private_subnets  = ["10.99.3.0/24", "10.99.4.0/24", "10.99.5.0/24"]
  database_subnets = ["10.99.7.0/24", "10.99.8.0/24", "10.99.9.0/24"]

  create_database_subnet_group = true

  tags = local.tags
}

#Use assume roles in place of iam users 
#Use s3bucket
#fix the issue with performance_insights_enabled, performance_insights_retention_period
#create_monitoring_role, monitoring_interval 