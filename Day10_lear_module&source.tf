my-project/
├── main.tf                 <-- Your root file (where you run commands)
└── modules/
    └── vpc/                <-- Your custom VPC module folder
        ├── main.tf         (The actual resources, like aws_vpc)
        ├── variables.tf    (Inputs the module expects)
        └── outputs.tf      (Outputs the module spits back out)



# This is inside your root /my-project/main.tf

module "my_dev_vpc" {
  # 1. THE PATH: Point to the folder where the module lives
  source = "./modules/vpc"  

  # 2. THE INPUTS: Pass in any variables that the module's variables.tf requires
  vpc_cidr   = "10.0.0.0/16"
  env_prefix = "dev"
}

module "my_prod_vpc" {
  # You can call the exact same module again for a different environment!
  source = "./modules/vpc"  

  vpc_cidr   = "10.10.0.0/16"
  env_prefix = "prod"
}
