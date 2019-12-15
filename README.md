# platform-terraform-aws
This repository contains code for creating and launching a new aws VPC and its internal elements

## Summary

This project is related to infrastructure as a code. All the configurations are made based on security best practices, and ISO compliance.

## Getting Started

### Prerequisites

* You need access keys for applying the plan, although you can view the plan with some random keys.
* python3, pip and aws-cli needs to be installed on your system
* Install terraform version > 0.12.1 for mac use -> `brew install terraform` and for windows use -> `choco install terraform` or download terraform manually and set its path
* All these scripts can only be executed from admin user programmatic access keys.

## Configuration and Execution

### Configuration

* AWS profile configuration
```
aws configure --profile terraform
```
* Update ~/.aws/credentials file with admin access keys (as the keys need delete permissions as well) that will look something like
```
[default]
aws_access_key_id = REDACTED
aws_secret_access_key = REDACTED
[terraform]
aws_access_key_id = REDACTED
aws_secret_access_key = REDACTED
```
* Now update ~/.aws/config file that look something like
```
[profile terraform]
region = eu-central-1
output = json
```
* Terraform can pick up credentials, but not the region, so we need to tell terraform about our default region
```
export TF_VAR_region=$(
  awk -F'= ' '/region/{print $2}' <(
    grep -A1 "\[.*$AWS_PROFILE\]" ~/.aws/config)
)
```
* Downloading terraform plugins
```
pushd /infra/ && terraform init && popd
pushd /webapp/ && terraform init && popd
```

### Execution
* You can execute the terraform code by doing the following steps
```
# setup variables
export AWS_DEFAULT_PROFILE="terraform"
export AWS_PROFILE=$AWS_DEFAULT_PROFILE
export TF_VAR_profile=$AWS_DEFAULT_PROFILE
export TF_VAR_region=$(
  awk -F'= ' '/region/{print $2}' <(
    grep -A1 "\[.*$AWS_PROFILE\]" ~/.aws/config)
)
# initialize modules and see changes
cd /infra
terraform init
terraform plan
# create infrastructure
terraform apply
# cleanup infrastructure
terraform destroy

```

## Versioning

* Version 1.0