db_identifier = ""

db_engine               = "mysql"
db_engine_version       = "8.0.20"
db_family               = "mysql8.0" # DB parameter group
db_major_engine_version = "8.0"      # DB option group
db_instance_type       = "db.t3.large"

db_allocated_storage = 20

db_name                   = "completeMysql"
db_username               = "complete_mysql"
db_port                   = 3306

db_vpc_security_group_ids =  ""
vpc_security_group_ids = ""

db_maintenance_window = "Mon:00:00-Mon:03:00"
db_backup_window      = "03:00-06:00"

backup_retention_period = 0

create_db_option_group    = false
create_db_parameter_group = false