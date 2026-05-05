The day 2 of learing terraform 

So far 
Teeraform is the written in hcl (hashicorp language) and our cloud providers like aws services works with api 

so to bridge this we need a provider we use aws provider here [ this is maintained by aws team]
https://registry.terraform.io/providers/hashicorp/aws/latest/docs


Here version matter like the terraform version and terraform provider version should be compatable , keep the version which we used to devlop
If no version of teeraform is mentioned then it will take the default

In terraform resources are used to create the service/resources in the cloud .


Below is the basic usage of the terraform to creata a vpc 

resource "aws_vpc" "example1" {
  cidr_block = "10.0.0.0/16"
  
}

Her example is not the name of the vpc it is the local name given to it 

Like suppose we want to create an ec2 instace in the vpc post it got created

we will do as following

resource "aws_ec2_host" "name" {
    vpc_id = aws_vpc.example.id 
}

vpc name we will provide in tag section as  Name = "vpc example" 


Use can can your aws acoount using
aws configure

create a user [access key] and secreate and login from the terminal

Once we are done to state the creation we do

terraform init  -> this we start the process install the provider and setup the platform for us.

terraform plan -> this will compare the resouces with existing resoureces presnet like same name/id.
