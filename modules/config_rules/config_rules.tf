#
# S3 Versioning Enabled
#
resource "aws_config_config_rule" "s3_versioning" {
  count = var.enabled ? 1 : 0
  name        = "${var.name_prefix}s3-versioning${var.name_suffix}"
  description = "Verify versioning is enabled on S3 Buckets."

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_VERSIONING_ENABLED"
  }

  scope {
    compliance_resource_types = ["AWS::S3::Bucket"]
  }

  depends_on = [aws_config_configuration_recorder.main]
}


/*
module "s3_versioning_remediation" {
  source      = "../remediation/configure_s3_versioning"
  config_rule = aws_config_config_rule.s3_versioning
  name_prefix = var.name_prefix
  name_suffix = var.name_suffix
}
*/

#
# S3 Tagging Enabled
#
resource "aws_config_config_rule" "required-tags" {
  count = var.enabled ? 1 : 0
  name        = "${var.name_prefix}required-tags${var.name_suffix}"
  description = "Verify that tags exist on S3 Buckets."

  source {
    owner             = "AWS"
    source_identifier = "REQUIRED_TAGS"
  }

  input_parameters = jsonencode({
    tag1Key = "NewSPGlobalTag"
    tag2Key = "Owner"

  })


  scope {
    compliance_resource_types = [
      "AWS::S3::Bucket",
      "AWS::IAM::Role"
    ]
  }

  depends_on = [aws_config_configuration_recorder.main]
}
