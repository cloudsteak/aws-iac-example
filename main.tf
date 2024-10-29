module "s3_backend" {
  source             = "./modules/s3_backend"
  region             = "your-region"
  s3_bucket_name     = "your-tf-state-bucket-name"
  dynamodb_table_name = "terraform-lock-table"
  tags               = {
    Environment = "Production"
    Project     = "AWS-IAC-SINGLE-REPOSITORY"
  }
}
