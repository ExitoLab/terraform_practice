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
  default = true
}

variable "db_allocated_storage" {
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

variable "deletion_protection" {
  description = "The database can't be deleted when this value is set to true."
  type        = bool
  default     = false
}