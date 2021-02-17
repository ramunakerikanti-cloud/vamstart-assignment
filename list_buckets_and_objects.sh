#!/bin/bash
##### Bucket Creation
#for arg: do
#aws s3api create-bucket --bucket $arg
#done

for arg; do
	echo -e "\033[1mList of buckets\033[0m"
	aws s3api list-buckets --query 'Buckets[*].{Bucket_Name:Name,Bucket_creation_date:CreationDate}' --output table
	echo "----------------------------------------------------------------------------------------------------------"

	echo -e "\033[1m$arg bucket Objects List\033[0m"
	aws s3api list-objects --bucket $arg --query "Contents[].{Key: Key}" --output text
done
