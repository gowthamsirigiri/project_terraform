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
