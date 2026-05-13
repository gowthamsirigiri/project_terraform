
resource "aws_ec2_host" "ec2_local_name_host" {
  count = var.Ec2_count #This is a number data type 
  instance_type     = "c5.18xlarge"
  availability_zone = "us-west-2a"
  region = tolist(var.aws_region)[0] #This a string data type
  region = var.region_aws #This a string data type 
  region = var.config.region #this is used for object elements iteration
  monitoring = true 
  associate_public_ip_address = true # this of Bool data type 

}


variable "cidr_block" {
    description = below are the cidr are ranges for the vpc 
    type = list(string)
    default = ["10.1.0.0/16","10.198.0.0/16","100.1.0.0/28"] # this is a list data type 
}

#set_type
variable "aws_region" {
    description = region of aws are listed here 
    type = set(string)
    default = [us-east-1,us-west-1,us-east-1] #this act as similar python set datatype 

    tags = var.tags_for_dev

}

#map data type 
variable "tags_for_dev" {
    type = map(string)
    default = {
        environment = "dev"
        created_by = "terraform"
    }
}

#tuple datatype  is a coolect diff datatypes in it list number, string etc 
variable "ingress_rule" {
    type=tuple([ number , string , number])
    default= [ 443 , "tcp" , 443 ]
}


#object datatype 
#usage is defibed in line #17
variable "config"{
    type = object ({
        monitoring = Bool 
        # region = string 
        region = "us-east-1"
        count = number
    })
}

#to access the set elements we need to covert that into a list and interate via index mention in line #15

#sg_resource

resource "aws_security_group_rule" "example" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = var.ingress_rule[1]
  cidr_blocks       = var.cidr_block
  ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = "sg-123456"
}
