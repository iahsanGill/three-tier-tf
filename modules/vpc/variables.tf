variable "project_name" {
  description = "The name of project"
  type        = string
}

variable "availability_zones" {
  description = "The availability zones"
  type        = list(string)
  default     = ["ap-southeast-1a", "ap-southeast-1b"]
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "region" {
  description = "The aws region"
  type        = string
  default     = "ap-southeast-1"
}

