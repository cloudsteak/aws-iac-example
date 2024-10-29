terraform {
  backend "s3" {
    bucket         = "placeholder"               # Placeholder; will be overridden in GitHub Actions
    key            = "path/to/terraform.tfstate" # Customize the path to your state file
    region         = "placeholder"               # Placeholder; will be overridden in GitHub Actions
    dynamodb_table = "placeholder"               # Placeholder; will be overridden in GitHub Actions
    encrypt        = true
  }
}

# Existing module call
module "s3_backend" {
  source             = "./modules/s3_backend"
  region             = "your-region"             # Replace with actual region or use a variable
  s3_bucket_name     = "your-tf-state-bucket-name" # Replace with your bucket name
  dynamodb_table_name = "terraform-lock-table"    # Replace with your DynamoDB table name
  tags               = {
    Environment = "Production"
    Project     = "AWS-IAC-SINGLE-REPOSITORY"
  }
}
