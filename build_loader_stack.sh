#!/usr/bin/env bash

AWSProfile=default
AWSRegion=us-east-1
KmsKeyArn="arn:aws:kms:us-east-1:360700421582:key/3d81985d-227a-4842-9b6c-1a18ac3f6907"

# build the master stack with the sub-stacks
aws --profile $AWSProfile --region $AWSRegion \
    cloudformation create-stack \
    --stack-name LambdaRedshiftLoader \
    --template-body file://deploy.yaml \
    --capabilities \
    CAPABILITY_NAMED_IAM \
    CAPABILITY_AUTO_EXPAND \
    CAPABILITY_IAM \
    --parameters \
    ParameterKey=KmsKeyArn,ParameterValue=$KmsKeyArn \
    --disable-rollback