terraform {
  backend "s3" {
    bucket         = "terraform-aws-splunk-enabler"
    key            = "default/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-aws-splunk-enabler"
    encrypt        = true
  }
}
