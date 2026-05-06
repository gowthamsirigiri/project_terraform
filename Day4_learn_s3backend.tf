#basic Vpc creation main.tf file

terraform {

  #adding the state file to s3 bucket
  backend "s3" {
    # Define the name of your bucket and the key for the state file.
    bucket = "my_state_file_bucket"
    key    = "/dev/state.tf"
    encrypt = true 
    use_lockfile = true  
    region = "us-east-1"  
  }
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

resource "aws_s3_bucket" "local_name_of_my_bucket" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My first bucket"
    Environment = "Dev"
  }
}
