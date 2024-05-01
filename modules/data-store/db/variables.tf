variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "subnets_ids" {
  description = "The ids of subnet for the the db"
  type        = list(string)
}

variable "ingress_cidr_blocks" {
  description = "CIDR block to allow traffic from"
  type        = list(string)
}

variable "db_allocated_storage" {
  description = "The amount of storage in gigabytes to allocate for the DB instance"
  type        = number
  default     = 100
}

variable "db_storage_type" {
  description = "The storage type to be associated with the DB instance"
  type        = string
  default     = "gp3"
}

variable "db_engine" {
  description = "The name of the database engine to be used for the DB instance"
  type        = string
  default     = "mysql"
}

variable "db_engine_version" {
  description = "The version number of the database engine to use"
  type        = string
  default     = "8.0"
}

variable "db_instance_class" {
  description = "The compute and memory capacity of the DB instance"
  type        = string
  default     = "db.t3.micro"
}

variable "db_username" {
  description = "The master username for the database"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "The master password for the database"
  type        = string
  sensitive   = true
}

variable "db_parameter_group_name" {
  description = "The name of the DB parameter group to associate with this instance"
  type        = string
  default     = "default.mysql8.0"
}

variable "db_multi_az" {
  description = "Specifies whether the DB instance is a multiple Availability Zone deployment"
  type        = bool
  default     = true
}

variable "db_skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted"
  type        = bool
  default     = true
}

variable "db_publicly_accessible" {
  description = "Specifies whether the DB instance is publicly accessible"
  type        = bool
  default     = false
}




