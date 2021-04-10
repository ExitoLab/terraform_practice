module "db" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-rds.git?ref=v2.34.0"

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

  tags = local.tags

  # DB subnet group
  subnet_ids = var.db_subnet_ids

  # DB parameter group
  family = var.db_family

  major_engine_version = var.db_major_engine_version

  final_snapshot_identifier = var.db_final_snapshot_identifier

  deletion_protection = var.db_deletion_protection
}