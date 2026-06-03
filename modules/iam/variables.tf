#=====================================
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