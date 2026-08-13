#Reduces Code Duplication: Define a complex expression once and reuse it across multiple resources.

# 1. Defining local variables
locals {
  service_name = "billing-api"
  environment  = var.env_name # Can pull from an input variable
  
  # Combining values dynamically (String Interpolation)
  bucket_name  = "${local.service_name}-${local.environment}-storage" 
  
  # Standardizing tags
  common_tags = {
    Project   = "FinanceApp"
    ManagedBy = "Terraform"
  }
}

# 2. Referencing local variables in a resource
resource "aws_s3_bucket" "storage" {
  bucket = local.bucket_name # Reference syntax

  tags = local.common_tags
}
