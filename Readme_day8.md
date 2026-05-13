Day8


<img width="2432" height="1228" alt="image" src="https://github.com/user-attachments/assets/8babdd5f-2f64-4958-9321-9d5329a8b56a" />


Today we are learning about meta arguments in tf #alias tf=terraform 

We have differn meta arguments below 

depends_on : here we have explicit dependency means one resources is dependent on other resource creation 
#ex : vpc must create first before we create the subnets or other resouce in a cloud
one will wait till the dependent gets created, post that will execute it.

count : this is like a count provider function basically count the number in a list, tuple etc 

for_each : this a for loop iteracte on each index of the data type

provider : this are like provicers aws cloud or gcp more like this briding between tf and the infra providers 

lifecycle will look at this next 


