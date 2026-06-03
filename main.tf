#============================
# VPC
#============================
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr               = var.vpc_cidr
  public_subnet_cidr_01  = var.public_subnet_cidr_01
  public_subnet_cidr_02  = var.public_subnet_cidr_02
  private_subnet_cidr_01 = var.private_subnet_cidr_01
  private_subnet_cidr_02 = var.private_subnet_cidr_02
}

module "iam" {
  source = "./modules/iam"

  ec2_role_name             = var.ec2_role_name
  ec2_role_policy_arn       = var.ec2_role_policy_arn
  ec2_instance_profile_name = var.ec2_instance_profile_name
}

module "ec2" {
  source = "./modules/ec2"

  project_name  = var.project_name
  environment   = var.environment
  instance_type = var.instance_type

  vpc_id                    = module.vpc.vpc_id
  public_subnet_1_id        = module.vpc.public_subnet_ids[0]
  iam_instance_profile_name = module.iam.ec2_instance_profile_name
}


module "alb" {
  source = "./modules/alb"

  alb_name           = var.alb_name
  vpc_id             = module.vpc.vpc_id
  public_subnet_1_id = module.vpc.public_subnet_ids[0]
  public_subnet_2_id = module.vpc.public_subnet_ids[1]
  target_instance_id = module.ec2.instance_id
  project_name       = var.project_name
  environment        = var.environment
  domain_name        = var.domain_name
  certificate_arn    = var.certificate_arn
}


module "db" {
  source                         = "./modules/rds"
  vpc_id                         = module.vpc.vpc_id
  private_subnet_1               = module.vpc.private_subnet_ids[0]
  private_subnet_2               = module.vpc.private_subnet_ids[1]
  project_name                   = var.project_name
  environment                    = var.environment
  db_name                        = var.db_name
  db_engine                      = var.db_engine
  db_engine_version              = var.db_engine_version
  db_instance_class              = var.db_instance_class
  db_user                        = var.db_user
  db_manage_master_user_password = var.db_manage_master_user_password
}
