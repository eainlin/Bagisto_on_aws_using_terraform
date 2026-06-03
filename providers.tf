terraform {
  required_version = ">= 1.10.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.47.0"
    }
  }
}

provider "aws" {
  region  = "ap-southeast-1"
  profile = "ecommerse"

  default_tags {
    tags = {
      project     = "prod"
      environment = "prod"
      managed_by  = "terraform"
    }
  }
}