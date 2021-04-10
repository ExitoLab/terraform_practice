module "db" {
  source = "https://github.com/terraform-aws-modules/terraform-aws-rds.git?ref=v2.34.0"

  identifier = var.db_identifier

  engine            = var.db_engine
  engine_version    = var.db_engine_version
  instance_class    = var.db_instance_type
  allocated_storage = var.db_allocated_storage
  storage_encrypted = var.db_storage_encrypted

  name     = var.db_name
  username = var.db_username
  password = var.db_password
  port     = var.db_port

  vpc_security_group_ids = var.db_vpc_security_group_ids

  maintenance_window = var.db_maintenance_window
  backup_window      = var.db_backup_window


  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  # DB subnet group
  subnet_ids = var.db_subnet_ids

  # DB parameter group
  family = var.db_family

  major_engine_version = var.db_major_engine_version

  final_snapshot_identifier = var.db_final_snapshot_identifier

  deletion_protection = var.db_deletion_protection
}


module "db_default" {
  source = "../../"

  identifier = "${local.name}-default"

  create_db_option_group    = false
  create_db_parameter_group = false

  # All available versions: http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_MySQL.html#MySQL.Concepts.VersionMgmt
  engine               = "mysql"
  engine_version       = "8.0.20"
  family               = "mysql8.0" # DB parameter group
  major_engine_version = "8.0"      # DB option group
  instance_class       = "db.t3.large"

  allocated_storage = 20

  name                   = "completeMysql"
  username               = "complete_mysql"
  create_random_password = true
  random_password_length = 12
  port                   = 3306

  subnet_ids             = module.vpc.database_subnets
  vpc_security_group_ids = [module.security_group.this_security_group_id]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  backup_retention_period = 0

  tags = local.tags
}