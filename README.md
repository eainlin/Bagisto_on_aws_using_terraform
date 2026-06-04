### Date   : 06-Jun-2026
### Author : Htoo Eain Lin 

# Bagisto on AWS using Terraform

## Overview

This repository contains Terraform and Packer configuration to deploy a Bagisto-based e-commerce application on AWS. It automates provisioning of the VPC, EC2 instances, RDS database, IAM policies, and Application Load Balancer.

The project also includes an Nginx configuration for serving Bagisto and a Packer build definition for creating a reusable EC2 AMI.

## Repository Structure

- `main.tf` - Root Terraform configuration that invokes module resources and infrastructure composition.
- `providers.tf` - AWS provider configuration and settings.
- `variables.tf` - Root-level input variables and defaults.
- `outputs.tf` - Root-level output values.
- `terraform.tfvars` - Example user values for Terraform variables.
- `modules/` - Reusable module folders.
  - `alb/` - Application Load Balancer configuration.
  - `ec2/` - EC2 instance and launch configuration.
  - `iam/` - IAM roles, policies, and instance profile resources.
  - `rds/` - Amazon RDS database deployment.
  - `vpc/` - VPC, subnets, route tables, and networking resources.
- `nginx_config/` - Nginx configuration file for Bagisto.
- `Packer/` - Packer build files and scripts for custom AMI creation.
  - `ami.pkr.hcl` - Packer template for AMI build.
  - `variables.pkr.hcl` - Packer variable definitions.
  - `versions.pkr.hcl` - Required Packer version constraints.
  - `script/run.sh` - Build script executed during AMI creation.
- `Install-Prerequisites.md` - External prerequisite instructions.

## Key Features

- Infrastructure-as-code deployment on AWS with Terraform
- Modular architecture using Terraform modules for VPC, EC2, RDS, ALB, and IAM
- Custom AMI creation via Packer for consistent server provisioning
- Nginx configuration optimized for Bagisto document root and permissions
- Supports a production-ready architecture with load balancing and managed database

## Prerequisites

- AWS account with IAM credentials configured
- Terraform installed (recommended version compatible with modules)
- Packer installed for AMI creation
- AWS CLI configured with valid credentials
- `Install-Prerequisites.md` may include package prerequisites and local setup guidance


## Packer AMI Build

To build the custom AMI used by EC2 instances:

```bash
cd Packer
packer init .
packer build -var-file=variables.pkr.hcl ami.pkr.hcl
```

## Deployment Steps

1. Clone the repository.
2. Review and update `terraform.tfvars` with your AWS region, instance details, and Bagisto deployment settings.
3. Initialize Terraform:
   ```bash
   terraform init
   ```
4. Validate Terraform configuration:
   ```bash
   terraform validate
   ```
5. Create an execution plan:
   ```bash
   terraform plan 
   ```
6. Apply the plan:
   ```bash
   terraform apply 
   ```



Update the AMI ID in your Terraform variable settings if applicable.

## Nginx Configuration

The `nginx_config/bagisto.conf` file is provided for the Bagisto virtual host. After deployment, ensure the web server points to the Bagisto installation directory and ownership is correct.

Example permission commands:

```bash
sudo chown -R www-data:www-data /var/www/html/bagisto
sudo chmod +x /var/www/html/bagisto
sudo chmod -R 755 /var/www/html/bagisto/public
```

## Reference
- Bagisto installation guide: https://devdocs.bagisto.com/getting-started/installation.html

## Notes

- This repository assumes Bagisto will be installed and served from `/var/www/html/bagisto`.
- Adjust Terraform module variables and networking configuration for your environment.
- Use secure AWS best practices for IAM roles, secrets management, and production deployments.

