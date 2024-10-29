variable "region" {
  description = "The AWS region where resources will be created."
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket for storing Terraform state."
  type        = string
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table for Terraform state locking."
  type        = string
}

variable "tags" {
  description = "Tags to apply to the S3 bucket and DynamoDB table."
  type        = map(string)
  default     = {
    Environment = "Terraform-Backend"
    Project     = "IaC"
  }
}
