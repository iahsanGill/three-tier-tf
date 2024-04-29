##--REQUIRED VARIABLES--##

variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "vpc_id" {
  description = "Id of the VPC"
  type        = string

}

variable "sub_1_id" {
  description = "Id of subnet-1 of vpc for the instance"
  type        = string
}

variable "sub_2_id" {
  description = "Id of subnet-2 of vpc for the instance"
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block to allow traffic from"
  type        = string
}

##--OPTIONAL VARIABLES--##

variable "instance_type" {
  description = "The type of instance to run for the frontend tier"
  type        = string
  default     = "t2.micro"
}

variable "image_id" {
  description = "The AMI ID to use for the instances in the frontend tier"
  type        = string
  default     = "ami-0b3a4110c36b9a5f0"
}

variable "min_size" {
  description = "The minimum number of instances in the frontend tier"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "The maximum number of the instances in the frontend tier"
  type        = number
  default     = 2
}
