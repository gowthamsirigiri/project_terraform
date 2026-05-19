Day10


<img width="2608" height="1280" alt="image" src="https://github.com/user-attachments/assets/1759299e-5ca0-4502-a724-e3fa0478ab32" />


Learning abot expressions in terraforms 


This will help us not to rewrite every code block again and again 


conditional expressions 

syntax: condition ? true_value : false_value

sample: var.env="Dev" ? "t2.micro" : "t1.micro" 


dynamic block 
we use this when we wana iterate on multiple values 

splat expressions 
Splat expressions only work on ordered lists or sets. They do not work on maps or dictionaries.




























terraform.state lock proceedure and process 

To enable state locking, you must use a backend that supports it and configure a lock mechanism.
State locking automatically locks your state file during any operation that writes data (like terraform apply), preventing other team members from running updates simultaneously.
Step-by-Step Configuration by Provider
Select your cloud provider below to implement state locking:
1. Amazon Web Services (AWS)
AWS uses an S3 bucket for storage and a DynamoDB table for locking.
Create a DynamoDB table with a Partition Key named exactement LockID (string).
Add the dynamodb_table argument to your backend configuration.
hcl
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "my-lock-table" # Enables locking
  }
}






















Here is exactly how they work together:
The Real Workflow
S3 is the only storage: Your actual architecture data (terraform.tfstate) lives exclusively inside the S3 bucket [1].
DynamoDB is just a padlock: The DynamoDB table only stores a tiny, temporary record called a "Lock ID" when a command is running.
Step-by-Step of a Terraform Run
Step 1 (Lock): You type terraform apply. Terraform immediately writes a "Lock ID" into DynamoDB.
Step 2 (Check): If a teammate tries to run terraform apply at the exact same second, their Terraform checks DynamoDB, sees the lock record, and stops them with an error.
Step 3 (Write): Your Terraform makes the infrastructure changes and saves the new state file to S3 [1].
Step 4 (Unlock): Once finished, Terraform deletes the "Lock ID" record from DynamoDB so the next person can use it.
In short: DynamoDB handles the traffic control (locking), while S3 handles the actual data (storage) [1]. They do not mirror or sync infrastructure data with each other.
If you are ready, I can:
Provide the exact HCL code to build this S3 and DynamoDB pair safely.
Explain what happens if a lock gets stuck and how to clear it.
Show you how to secure the S3 bucket with encryption and versioning.
What would you like to explore next?





