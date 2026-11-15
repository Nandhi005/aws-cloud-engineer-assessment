variable "aws_region" {
  description = "AWS region in which the infrastructure is provisioned."
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR range for the project VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_1" {
  description = "CIDR range for public subnet in the first Availability Zone."
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_2" {
  description = "CIDR range for public subnet in the second Availability Zone."
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_subnet_1" {
  description = "CIDR range reserved for the first private subnet."
  type        = string
  default     = "10.0.3.0/24"
}

variable "private_subnet_2" {
  description = "CIDR range reserved for the second private subnet."
  type        = string
  default     = "10.0.4.0/24"
}

variable "instance_type" {
  description = "EC2 instance type for the Auto Scaling Group."
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of an existing EC2 key pair in the selected AWS region."
  type        = string
}

variable "ssh_allowed_cidr" {
  description = "Single trusted IPv4 CIDR allowed to SSH to EC2. Set this to your public IP with /32."
  type        = string
  default     = "127.0.0.1/32"

  validation {
    condition     = can(cidrnetmask(var.ssh_allowed_cidr))
    error_message = "ssh_allowed_cidr must be a valid IPv4 CIDR block."
  }
}
