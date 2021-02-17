#!/bin/bash
##### Bucket Creation
#for arg: do
#aws s3api create-bucket --bucket $arg
#done

for arg; do

	echo -e "\033[1m$arg bucket objects Storage Class\033[0m"
	aws s3api list-objects-v2 --bucket $arg --query "Contents[].{Key: Key, StorageClass: StorageClass}" --output table
done
