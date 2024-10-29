provider "aws" {
  region = var.region
}

# S3 Bucket for Terraform State
resource "aws_s3_bucket" "tf_state" {
  bucket = var.s3_bucket_name

  
  lifecycle {
    prevent_destroy = true
  }

  tags = var.tags
}

# S3 Bucket Versioning Configuration
resource "aws_s3_bucket_versioning" "tf_state_versioning" {
  bucket = aws_s3_bucket.tf_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# S3 Bucket ACL
resource "aws_s3_bucket_acl" "tf_state_acl" {
  bucket = aws_s3_bucket.tf_state.id
  acl    = "private"
}

# DynamoDB Table for State Locking
resource "aws_dynamodb_table" "tf_lock" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = var.tags
}
