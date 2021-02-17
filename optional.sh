#!/bin/bash
for arg; do
echo -e "\033[1mGet Bucket CORS Conf\033[0m"
aws s3api get-bucket-cors --bucket $arg --output text
echo "----------------------------------------------------------------------------------------------------------"

echo -e "\033[1mGet Bucket Life-Cycle Conf\033[0m"
aws s3api get-bucket-lifecycle --bucket $arg --output text
echo "----------------------------------------------------------------------------------------------------------"
		
echo -e "\033[1mGet Bucket Replication conf\033[0m"
aws s3api get-bucket-replication --bucket $arg --output text
echo "----------------------------------------------------------------------------------------------------------"

echo -e "\033[1mBucket Count by Encryption Type\033[0m"
aws macie2 get-bucket-statistics --account-id 722490491344 --query "bucketCountByEncryptionType"
echo "----------------------------------------------------------------------------------------------------------"
done
