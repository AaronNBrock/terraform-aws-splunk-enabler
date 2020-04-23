provider "aws" {
  version = "~> 2"
  region  = "us-east-1"
}

module "managed_account" {
  source       = "./modules/managed_account"
  role_arn     = "arn:aws:iam::299840366891:role/aws-sentinel"
  endpoint_url = "https://splunk.jbennettconsulting.com:443"
  hec_token    = "beda0b1f-d761-4ea9-a15a-86ec16f119fd"
  enabled      = true
}
