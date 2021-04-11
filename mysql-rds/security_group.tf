module "security_group" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-security-group.git?ref=v3.18.0"
  name        = "mysql-rds"
  description = "Security group for mysql rds datab"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      description = "MySQL access from within VPC"
      cidr_blocks = module.vpc.vpc_cidr_block
    }
  ]
  tags = local.tags
}