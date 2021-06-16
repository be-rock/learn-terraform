# how to start

```shell
# example linux
SERVICES=s3,ec2,iam,cloudwatch TMPDIR=/tmp/localstack sudo docker-compose up

# example mac
SERVICES=s3,ec2,iam,cloudwatch TMPDIR=/tmp/localstack sudo docker-compose up

# interact with a service
awslocal s3 ls /
```
