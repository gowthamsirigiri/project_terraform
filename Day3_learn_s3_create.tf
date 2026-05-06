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

#Below is the snippet to create s3 bucket as s3 is global means can be accessbile 
#The bucket is reachable via the public internet (depending on its permissions)

resource "aws_s3_bucket" "local_name_of_my_bucket" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My first bucket"
    Environment = "Dev"
  }
}
