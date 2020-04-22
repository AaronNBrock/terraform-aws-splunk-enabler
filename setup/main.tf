provider "aws" {
  version = "~> 2"
  region  = "us-east-1"
}

module "aws-sentinel-backend" {
  source       = "github.com/AaronNBrock/s3-backend-resources.git?ref=v0.1.0"
  backend_name = "jb-aws-sentinel-backend"
}
