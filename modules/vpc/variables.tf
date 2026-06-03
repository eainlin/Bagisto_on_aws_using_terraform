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

