This is day4

Today topics are state file and remote backend how does they work
<img width="2460" height="1194" alt="image" src="https://github.com/user-attachments/assets/0c620278-dc36-4856-aa3b-e185c97d1876" />


When we run the terraform apply cmd there it will compare the deszired state[the changes we write in the main.tf file] with the actual state.

Which mean if we want to create two resoucre say a s3 bucket and ec2 it will check with the existing infra created by terraform.

<img width="2396" height="1216" alt="image" src="https://github.com/user-attachments/assets/9e4202b0-04d3-4f8c-ac9c-4510ae43647b" />

Here in the state.tf the details of the infrastructure is stored when we create it from terraform , if we want to import the exiting infra from aws there is a other will see later.



Here we have added the s3 backend proceess

Where will push our state.tf file meta data conect to the s3 bucket // we need to encrpt the file and block the public access

#Need to lock the file beacaue when multiple terraform apply cmd got triggred the state filw ont get mess up 

It will available one after the other to avoid the confilts







