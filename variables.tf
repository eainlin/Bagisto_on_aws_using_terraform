#============================
# VPC
#============================  
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = ""
}

variable "public_subnet_cidr_01" {
  description = "CIDR block for the first public subnet"
  type        = string
  default     = ""
}

variable "public_subnet_cidr_02" {
  description = "CIDR block for the second public subnet"
  type        = string
  default     = ""
}

variable "private_subnet_cidr_01" {
  description = "CIDR block for the first private subnet"
  type        = string
  default     = ""
}

variable "private_subnet_cidr_02" {
  description = "CIDR block for the second private subnet"
  type        = string
  default     = ""
}

# IAM Variables
#=====================================
variable "ec2_role_name" {
  description = "Name of the IAM role for EC2 instances"
  type        = string
  default     = ""
}

variable "ec2_role_policy_arn" {
  description = "ARN of the IAM policy to attach to the EC2 role"
  type        = string
  default     = ""
}

variable "ec2_instance_profile_name" {
  description = "Name of the IAM instance profile for EC2 instances"
  type        = string
  default     = ""
}

variable "project_name" {
  description = "Project name for AMI lookup and tags"
  type        = string
}

variable "environment" {
  description = "Environment tag"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = ""
}

variable "iam_instance_profile_name" {
  description = "Instance Profile Name"
  type        = string
  default     = ""
}

variable "domain_name" {
  type = string
}

variable "certificate_arn" {
  type = string
}

variable "alb_name" {
  type    = string
  default = ""
}


variable "db_name" {
  type = string
}

variable "db_engine" {
  type = string
}

variable "db_engine_version" {
  type = string
}

variable "db_instance_class" {
  type = string
}

variable "db_user" {
  type = string
}

variable "db_manage_master_user_password" {
  type = bool
}