provider "aws" {
  version = "~> 2"
  region  = "us-east-1"
} 

terraform {
  backend "s3" {
    bucket         = "jb-aws-sentinel-backend"
    key            = "default/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "jb-aws-sentinel-backend"
    encrypt        = true
  }
}

module "managed_account" {
  source   = "./modules/managed_account"
  role_arn = var.role_arn
  bucket_names = var.log_buckets
  endpoint_url = var.endpoint_url
  hec_token = var.hec_token
  enable_sqs = false
  enabled = true
}
