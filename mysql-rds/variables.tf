/*===== General Variables ========= */
variable "region" {
  type        = string
  default     = "us-east-1"
  description = "The region of the aws account"
}

/*===== VPC Variables ========= */

variable "vpc_cidr" {
  type    = string
  default = "10.99.0.0/18"
}

variable "subnet_cidr_1" {
  type        = string
  description = "Subnet cidr"
  default     = "172.16.0.0/24"
}

/*===== DB Variables ========= */

variable "db_identifier" {
  type = string
}

variable "db_engine" {
  type = string
}

variable "db_engine_version" {
  type = string
}
variable "db_instance_type" {
  type = string
}
variable "db_storage_encrypted" {
  type    = bool
  default = false
}

variable "db_multi_az" {
  type = bool
}

variable "db_allocated_storage" {
  type = string
}

variable "db_max_allocated_storage" {
  type = string
}

variable "db_name" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}

variable "db_port" {
  type = string
}

variable "db_vpc_security_group_ids" {
  type    = list(string)
  default = []
}

variable "db_maintenance_window" {
  type = string
}

variable "db_backup_window" {
  type = string
}

variable "db_backup_retention_period" {
  type = string
}

variable "db_skip_final_snapshot" {
  description = "The database can't be deleted when this value is set to true."
  type        = bool
}

variable "db_subnet_ids" {
  type    = list(string)
  default = []
}

variable "db_family" {
  type = string
}

variable "db_major_engine_version" {
  type = string
}

variable "final_snapshot_identifier" {
  description = "The name of your final DB snapshot when this DB instance is deleted."
  type        = string
  default     = null
}

variable "db_deletion_protection" {
  description = "The database can't be deleted when this value is set to true."
  type        = bool
  default     = false
}

variable "db_performance_insights_enabled" {
  type = bool
}

variable "db_create_monitoring_role" {
  type = bool
}

variable "db_performance_insights_retention_period" {
  type = string
}

variable "db_monitoring_interval" {
  type = string
}