#wruite the resource group for ec2 creation


#create_before_destroy
resource "aws_instance" "web_server" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
  #this resouce block will get executed when we run destory  terraform destory , but here the resouce will be created by the destory start the work in the cloud
  lifecycle {
    create_before_destroy = true
  }
}

#prevent_destroy 

#To actually delete this resource later, you must first change this value to false in your code and run terraform apply.
resource "aws_db_instance" "production_db" {
  allocated_storage = 20
  engine            = "postgres"

  lifecycle {
    prevent_destroy = true
  }
}


#ignore_changes
resource "aws_instance" "example" {
  ami           = "ami-123456"
  instance_type = "t2.micro"

  tags = {
    Name = "PersistentServer"
  }

  lifecycle {
    # Ignore changes to tags, even if someone edits them in the AWS Console
    ignore_changes = [
      tags,
    ]
  }
}

#replace_triggred_by
resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "null_resource" "post_vpc_setup" {
  # This provisioner runs your script/command
  provisioner "local-exec" {
    command = "echo 'VPC ${aws_vpc.main_vpc.id} was created' > setup_log.txt"
  }

  lifecycle {
    # If the VPC is recreated, this null_resource will be forced to run again
    replace_triggered_by = [
      aws_vpc.main_vpc
    ]
  }
}


#preconditions

resource "aws_instance" "host2"{
    ami           = "ami-123456"
    instance_type = "t2.micro"

  tags = {
    Name = "web_app"
  }

}

resource "aws_instance" "host2"{
    ami           = "ami-123456"
    instance_type = "t2.micro"

  tags = {
    Name = "backend_app"
  }

  lifecycle{
    precondition{

    condition = aws_instance..instance_state == "running"

    error_message = "still web server is not running will fail first"
  }
  }

}

#postcondition 

resource "aws_instance" "host3"{
    ami="ami-4567"
    instance_type="t3.micro"

    lifecycle{
        postcondition{

        condition=self.ami == "ami-4567" or condition = aws_instance.host3.ami == "ami-4567"

        error_message= "Resourece is not created properly with the right ami given"
    }
    }
}

