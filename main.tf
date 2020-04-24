provider "aws" {
  version = "~> 2"
  region  = "us-east-1"
}

module "managed_account" {
  source   = "./modules/managed_account"
  role_arn = "arn:aws:iam::299840366891:role/aws-sentinel"
  enabled  = false
}

module "managed_account2" {
  source   = "./modules/managed_account"
  role_arn = "arn:aws:iam::736998830959:role/terraform-aws-enable-splunk"
  enabled  = false
}
