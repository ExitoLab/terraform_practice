module "db" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-rds.git?ref=v2.34.0"

  identifier = var.db_identifier

  engine            = var.db_engine
  engine_version    = var.db_engine_version
  instance_class    = var.db_instance_type
  allocated_storage = var.db_allocated_storage
  storage_encrypted = var.db_storage_encrypted

  max_allocated_storage = var.db_max_allocated_storage

  name     = var.db_name
  username = var.db_username
  password = var.db_password
  port     = var.db_port

  # DB subnet group

  subnet_ids             = module.vpc.database_subnets
  vpc_security_group_ids = [module.security_group.this_security_group_id]

  maintenance_window = var.db_maintenance_window
  backup_window      = var.db_backup_window

  multi_az = var.db_multi_az

  tags = local.tags

  # DB parameter group
  family = var.db_family

  major_engine_version = var.db_major_engine_version

  final_snapshot_identifier = var.db_final_snapshot_identifier

  deletion_protection = var.db_deletion_protection

  enabled_cloudwatch_logs_exports = ["general"]

  backup_retention_period = var.db_backup_retention_period
  skip_final_snapshot     = var.db_skip_final_snapshot


  performance_insights_enabled          = var.db_performance_insights_enabled
  performance_insights_retention_period = var.db_performance_insights_retention_period
  create_monitoring_role                = var.db_performance_insights_enabled
  monitoring_interval                   = var.db_monitoring_interval

  parameters = [
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    }
  ]


  db_instance_tags = {
    "Sensitive" = "high"
  }
  db_option_group_tags = {
    "Sensitive" = "low"
  }
  db_parameter_group_tags = {
    "Sensitive" = "low"
  }
  db_subnet_group_tags = {
    "Sensitive" = "high"
  }
}