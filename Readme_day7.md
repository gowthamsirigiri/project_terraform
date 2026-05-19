Day 5

Todays concept is variables in terraform

<img width="2506" height="1142" alt="image" src="https://github.com/user-attachments/assets/8aa71b98-771d-4421-99a2-47cbcf4df9c3" />


First type -> Input varibale -> this varibale are difened by using below syntax

variable "environment" { 
  type        = string
  default     = "dev"
  description = "naming of the resouce belongs to !"
}

/// Environment = var.environment

second type -> locals -> we define the variable key values and used it in this below way 

locals {
  team = "team_name"
} 


///  label = local.team


Third type -> output -> here we will wait for the value like we need the vpc id post it got created we will fetch it ans use it in the tf yml
output vpc_id_local_name {
  value       = aws_vpc.example1.id      
}

<img width="1886" height="1106" alt="image" src="https://github.com/user-attachments/assets/b80e5b70-0253-4f71-9935-32eef4941d56" />


We can also create a file terraform.vars / terraform.vars.json 

and enter the key values there

environment = preprod 




This has the higher preciidenc 

terraform apply main.yml -var environment=prod
