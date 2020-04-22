# config_rules
This module contains AWS Config resource definitions.

## Resources:
* S3 Tagging Config rule.
* IAM Tagging Config rule.
* (Optional) S3 Bucket versioning and remediation.

## Description:
AWS Config Rules:
The AWS Config service allows for the creation of configuration rules that can be checked against resources within an AWS account.  It also lists the resources within an AWS account and maintains a history of changes once the service is enabled.  AWS Config Aggregator allows the collection of resources across multiple accounts.  The creation of policies and the ability to create the aggregator has been integrated into a pipeline.
The aggregator must be created in the AWS Organization master account so that it can use the appropriate profile to gather data from AWS Config in the other accounts.  The Jenkins server is located in the corporate InfoSec account and assumes the appropriate role to be able to create config rules that apply down to the member accounts and to collect configuration information and compare to the rules that are enabled. 


