#condition expression 
resource "aws_instance" "web_server" {
  ami           = "ami-12345678"
  instance_type = var.environment == "dev" ? "t2_micro" : "t3_micro"
  instance_type = "t2.micro"
  tags =   var.tags

}



#Dynamic expressions 

variable "ingress_ports" {
  type        = list(number)
  default     = [80, 443, 8080]
  description = "List of ports to open"
}
 



 resource "aws_security_group" "aws_sg"{
    name = "web-app"
    dynamic "ingress" {
        content {
        for_each = var.ingress_ports
        to_port = ingress.value
        from_port = ingress.value
        }
    }
 }


 #output of the above 
 resource "aws_security_group" "web_sg" {
  name = "web-traffic"

  # Generated from Iteration 1
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Generated from Iteration 2
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Generated from Iteration 3
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



#splat expression 
resource "aws_instance" "web" {
  count = 3
  ami   = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
} 

output "all_private_ip"{
    value = aws_instance.web[*].private_ip 
}


# Output result:
# ["10.0.1.5", "10.0.1.6", "10.0.1.7"]



# 1. Using a Splat Expression (Clean and Short)
value = aws_instance.web[*].private_ip

# 2. Using a For Loop (More Verbose)
value = [for instance in aws_instance.web : instance.private_ip]



expression conditon 

resource "aws_ec2_instace" "instance" {
    ami=""
    instance_type= var.environment=="Dev" : "t2.micro" ? "t1.micro"

    tags = {
        name = "test"

    }
}

 
