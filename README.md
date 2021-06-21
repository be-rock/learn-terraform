# learn-terraform

## localstack

Localstack will allow you to interact with aws-like resources on your local machine without risking any of the unexpected expenses of using your personal aws account.

### start localstack

Below are examples of how to start localstack on both linux and mac. The latest docker-compose.yml can be retrieved from the [localstack github repository](https://github.com/localstack/localstack)

```shell
# start localstack - linux
SERVICES=s3,ec2,iam,cloudwatch TMPDIR=/tmp/localstack sudo docker-compose up

# start localstack - mac
SERVICES=s3,ec2,iam,cloudwatch TMPDIR=/tmp/localstack docker-compose up
```

### provisioning resources through localstack

Create an aws profile using `aws configure` called 'localstack'

```terraform
# example
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  profile                     = "localstack"
  region                      = "us-east-1"
  skip_requesting_account_id  = true
  skip_credentials_validation = true

  endpoints {
    dynamodb = "http://localhost:4566"
    s3       = "http://localhost:4566"
  }
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket"
  acl    = "private"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
```

### interacting with localstack resources

`awslocal` can be created as a shell alias to your localstack aws cli profile or can be pip installed.

#### s3

```shell
# example with s3 to list buckets
awslocal s3 ls /
```
