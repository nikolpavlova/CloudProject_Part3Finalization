#This is the file that helps Terraform install the aws provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.20"
    }
  }
}


provider "aws" {
  region = var.aws_region
}
