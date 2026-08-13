#syntax ->    condition ? true_value : false_value

#In Terraform, the ternary operator is the primary tool used to write inline conditional expressions. It allows you to dynamically choose between two values based on a boolean condition.


variable "environment" {
  type    = string
  default = "dev"
}

resource "aws_instance" "app" {
  ami           = "ami-12345678"
  # Uses large instance for prod, micro for everything else
  instance_type = var.environment == "prod" ? "t3.large" : "t3.micro" 
}
