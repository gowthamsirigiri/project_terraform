
#here we are using count metadata for iteration on bukcets creation
resource "aws_s3_bucket" "bucket1" {
  count = 2
  bucket = var.buckets_names[count.index]

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
} 

#this is for list example for count
variable "buckets_names" {
    description="Below are the list of bukcet that we need for creation"
    type=list(string)
    default=["s1","s2","s3"]
}


#for_each example
resource "aws_s3_bucket" "buckets2" {
    for_each=var.buckets_names_set
    bucket = each.value # here we can use each.key and each.value for set it don't matter but for map it matters
    
    #usage of depens_on 
    depens_on=[aws_s3_bucket.bucket1]
    #here we are stating that bucket2 is dependent on bucket 1 , once bucket 1 is created then only proceed to create bucket 2 


}




#used for for_each 
variable "buckets_names_set" {
    description="Below are the set of bukcet that we need for creation"
    type=set(string)
    default=["s1","s2","s3"]
}



#...
variable "buckets_names_map"{
    description="map datatype buckets"
    type=map(string)
    default={
        "first_bucket"="k1",
        "second_bucket"="k2"
    }
}
