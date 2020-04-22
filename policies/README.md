# AWS-Sentinel Implmented policies.

## Resources
1. __aws-sentinel-role__ - The role used by Jenkins to assume the roles
in the new accounts.
2. __aws-sentinel-assumed-role__ - The role assumed by aws-sentinel-role, 
in the new account, to on-board the new account.
3. __aws-splunk-integration-policy__ - Policy document for the 
permissions needed by both __aws-sentinel-role__ and
__aws-sentinel-assumed-role__.

## Implementing __aws-sentinel-role__ in a new account.
In the account where Jenkins will be running the build, create the role
Jenkins will use to assume the roles in the other accounts.
```
aws iam create-role \
    --role-name aws-sentinel-role \
    --assume-role-policy-document file://aws-sentinel-role-trust-policy.json
POLICY_ARN_1=$(aws iam create-policy \
    --policy-name aws-sentinel-role-policy \
    --policy-document file://aws-splunk-integration-policy.json \
    --query Policy.Arn \
    --output text)
aws iam attach-role-policy \
    --role-name aws-sentinel-role \
    --policy-arn ${POLICY_ARN_1}

```
In the new account, where the splunk integration is to be done, create the role,
create the policy, and attach the policy to the role.

```
aws iam create-role \
    --role-name aws-sentinel-assumed-role \
    --assume-role-policy-document file://aws-sentinel-assumed-role-trust-policy.json
POLICY_ARN_2=$(aws iam create-policy \
    --policy-name aws-sentinel-assumed-role-policy \
    --policy-document file://aws-splunk-integration-policy.json \
    --query Policy.Arn \
    --output text)
aws iam attach-role-policy \
    --role-name aws-sentinel-assumed-role \
    --policy-arn ${POLICY_ARN_2}
```
