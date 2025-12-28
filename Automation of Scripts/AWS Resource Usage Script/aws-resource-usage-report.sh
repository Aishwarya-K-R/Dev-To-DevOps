#!/bin/bash

###########################################################################
# Name: Aishwarya K R
# Date: 22/12/25
# Description: This script outputs the AWS Resources Usage on a daily basis
###########################################################################

# Debug Mode
set -x
set -e

echo "AWS Resource Usage Report On $(date):"

# Report Location
report="/Users/aishwaryakr/Documents/My Learnings/DevOps/Shell Scripts/Automation of Scripts/AWS Resource Usage Daily Report/aws-resource-usage-report-$(date +%F).log"

echo "List of EC2 Instances:"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> "$report"

echo "List of S3 Buckets:"
aws s3 ls >> "$report"

echo "List of Lambda Functions:"
aws lambda list-functions >> "$report"

echo "List of IAM Users:"
aws iam list-users >> "$report"
