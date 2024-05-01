variable "project_name" {
  description = "The name of project"
  type        = string
}

variable "region" {
  description = "The aws region for vpc and deployments"
  type        = string
}

variable "vpc_cidr_block" {
  description = "The cidr block for the VPC"
  type        = string
}

variable "availability_zones" {
  description = "The availability zones"
  type        = list(string)
}

variable "db_username" {
  description = "The username of the database"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "The password of the database"
  type        = string
  sensitive   = true
}
