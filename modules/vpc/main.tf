#==========================================
# Create VPC for bagisto ecommerce web app
#==========================================

resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "Bagisto-VPC"
  }
}

#============================================
# Create internet gateway for public instance 
#============================================

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Bagisto-Internet-Gateway"
  }
}

#===========================================
# Create public subnet 01 for ecommerce web app
#===========================================
resource "aws_subnet" "Bagisto-Public-Subnet-01" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidr_01
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "Bagisto-Public-Subnet-01"
  }
}

#===========================================
# Create public subnet 02 for ecommerce web app
#===========================================
resource "aws_subnet" "Bagisto-Public-Subnet-02" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidr_02
  availability_zone = "ap-southeast-1b"


  tags = {
    Name = "Bagisto-Public-Subnet-02"
  }
}

#=======================================
# Create private subnet 01 for database 
#=======================================
resource "aws_subnet" "Bagisto-Private-Subnet-01" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr_01
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "Bagisto-Private-Subnet-01"
  }
}

#=======================================
# Create private subnet 02 for database
#=======================================
resource "aws_subnet" "Bagisto-Private-Subnet-02" {
  vpc_id            = aws_vpc.main.id 
  cidr_block        = var.private_subnet_cidr_02
  availability_zone = "ap-southeast-1b"          

  tags = {
    Name = "Bagisto-Private-Subnet-02"
  }
}

#=======================================
# Create route table for public subnets
#=======================================  
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"  

    gateway_id = aws_internet_gateway.main.id
  }   
  tags = {
    Name = "Bagisto-Public-Route-Table"
  }
}

#=======================================
# Associate public subnets with route table
#=======================================
resource "aws_route_table_association" "public-subnet-01-association" {
  subnet_id      = aws_subnet.Bagisto-Public-Subnet-01.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "public-subnet-02-association" {
  subnet_id      = aws_subnet.Bagisto-Public-Subnet-02.id
  route_table_id = aws_route_table.public-rt.id
}

