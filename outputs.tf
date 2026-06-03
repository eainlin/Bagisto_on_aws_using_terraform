output "vpc_id" {
  value = module.vpc.vpc_id
}

output "ec2_role_arn" {
  value = module.iam.ec2_role_arn
}

output "ec2_instance_profile_name" {
  value = module.iam.ec2_instance_profile_name
}

output "ec2_instance_id" {
  value = module.ec2.instance_id
}
