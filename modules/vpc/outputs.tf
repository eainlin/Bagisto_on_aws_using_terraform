#====================================
# VPC Outputs
#====================================
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = [aws_subnet.Bagisto-Public-Subnet-01.id, aws_subnet.Bagisto-Public-Subnet-02.id]
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = [aws_subnet.Bagisto-Private-Subnet-01.id, aws_subnet.Bagisto-Private-Subnet-02.id]
}

output "public_route_table_id" {
  description = "The ID of the public route table"
  value       = aws_route_table.public-rt.id
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.main.id
}


