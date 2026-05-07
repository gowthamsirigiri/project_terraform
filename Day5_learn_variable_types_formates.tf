#basic Vpc creation main.tf file

terraform {

  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.43.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "example1" {
  cidr_block = "10.0.0.0/16"

tags = {
    Name = "vpc example"
  }

}

variable "environment" { #here env is the local name of the variable
  type        = string
  default     = "dev"
  description = "naming of the resouce belongs to !"
}

locals {
  team = "team_name"
}

output vpc_id_local_name {
  value       = aws_vpc.example1.id      
}




resource "aws_s3_bucket" "local_name_of_my_bucket" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My first bucket"
    Environment = var.environment
    label = local.team
    
  }
}




