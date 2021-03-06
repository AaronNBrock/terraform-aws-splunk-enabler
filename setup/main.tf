provider "aws" {
  version = "~> 2"
  region  = "us-east-1"
}

module "terraform-aws-splunk-enabler" {
  source       = "github.com/AaronNBrock/s3-backend-resources.git?ref=v0.1.0"
  backend_name = "terraform-aws-splunk-enabler"
}
