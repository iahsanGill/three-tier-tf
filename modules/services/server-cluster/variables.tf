##--REQUIRED VARIABLES--##

variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "tier" {
  description = "The tier of the project"
  type        = string
}

variable "vpc_id" {
  description = "Id of the VPC"
  type        = string

}

variable "vpc_zone_identifier" {
  description = "List of subnet ids of vpc in the auto-scaling group will be placed"
  type        = list(string)
}

variable "ingress_cidr_blocks" {
  description = "The CIDR blocks to allow traffic from"
  type        = list(string)
}

##--OPTIONAL VARIABLES--##

variable "instance_type" {
  description = "The type of instance to run"
  type        = string
  default     = "t2.micro"
}

variable "image_id" {
  description = "The AMI ID to use"
  type        = string
  default     = "ami-0e3a6d8ff4c8fe246"
}

variable "min_size" {
  description = "The minimum number of instances"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "The maximum number of the instances"
  type        = number
  default     = 2
}

variable "desired_capacity" {
  description = "The desired capacity of the instances"
  type        = number
  default     = 2
}

variable "associate_public_ip_address" {
  description = "The instance should be granted public ip or not"
  type        = bool
  default     = false
}

variable "load_balancer_listener_configuration" {
  description = "Configuration for the listener of the Application Load Balancer (ALB)."

  type = object({
    port     = number
    protocol = string
  })

  default = {
    port     = 80
    protocol = "HTTP"
  }
}
