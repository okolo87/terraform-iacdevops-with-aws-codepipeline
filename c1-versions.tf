# Terraform Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.2.0"
    }
    null = {
      source  = "hashicorp/aws"
      version = "~> 4.2.0"
    }
      random = {
      source = "hashicorp/random"
      version = "~> 3.0"
    }
  }
  # Adding Backend as S3 for Remote State Storage
  Backend "s3" {}
}

# Provider Block
provider "aws" {
  region  = var.aws_region
  profile = "default"
}

# Create Random Pet Resource
resource "random_pet" "this" {
  length = 2
}