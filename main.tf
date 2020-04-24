provider "aws" {
  version = "~> 2"
  region  = "us-east-1"
}

module "managed_account" {
  source   = "./modules/managed_account"
  role_arn = "arn:aws:iam::299840366891:role/aws-sentinel"
  enabled  = true
}
