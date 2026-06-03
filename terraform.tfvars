vpc_cidr               = "10.0.0.0/16"
public_subnet_cidr_01  = "10.0.1.0/24"
public_subnet_cidr_02  = "10.0.2.0/24"
private_subnet_cidr_01 = "10.0.3.0/24"
private_subnet_cidr_02 = "10.0.4.0/24"

ec2_role_policy_arn       = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
ec2_instance_profile_name = "bagisto-ec2-instance_profile_name"
ec2_role_name             = "ssm_ec2_role"

project_name  = "bagisto"
environment   = "dev"
instance_type = "t3a.small"

domain_name     = "bagisto.infrasky.online"
certificate_arn = "arn:aws:acm:ap-southeast-1:534232119468:certificate/f44b5a66-53f1-4c71-90d8-d9e0ceb511d9"

db_name                        = "bootcamp_db"
db_engine                      = "mysql"
db_engine_version              = "8.4"
db_instance_class              = "db.t3.micro"
db_user                        = "admin"
db_manage_master_user_password = true