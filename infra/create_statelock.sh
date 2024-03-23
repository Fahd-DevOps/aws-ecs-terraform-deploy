#!/bin/bash

# variables
bucket_name="terraform-tfstate-01"
region="us-east-1"
dynamodb_table="terraform-tfstate"

# Function to check for errors
check_error() {
    if [ $? -eq 0 ]; then
        echo "Success: $1"
    else
        echo "Error: $2"
        exit 1
    fi
}

# Create S3 bucket
aws s3 mb s3://$bucket_name --region $region
check_error "S3 bucket creation successful" "Failed to create S3 bucket"

# Create DynamoDB table
aws dynamodb create-table \
  --table-name $dynamodb_table \
  --attribute-definitions "[{\"AttributeName\":\"LockID\",\"AttributeType\":\"S\"}]" \
  --key-schema "[{\"AttributeName\":\"LockID\",\"KeyType\":\"HASH\"}]" \
  --provisioned-throughput "{\"ReadCapacityUnits\":1, \"WriteCapacityUnits\":1}" \
  --region $region
check_error "DynamoDB table creation successful" "Failed to create DynamoDB table"

# to ensure DynamoDB table completes
sleep 5

# if you want to check again run
# aws dynamodb describe-table --table-name terraform-tfstate --region us-east-1
