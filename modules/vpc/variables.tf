variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "region" {
  description = "The aws region"
  type        = string
  default     = "ap-southeast-1"
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

variable "num_nat_gateways" {
  description = "Number of nat  gateways in the vpc"
  type        = number
  default     = 2
}


