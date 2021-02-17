#!/bin/bash
##### Bucket Creation
#for arg: do
#aws s3api create-bucket --bucket $arg
#done

for arg; do

	echo -e "\033[1m$arg bucket Last modified file\033[0m"
	aws s3 ls s3://$arg --recursive | sort | tail -n 1 | awk '{print $4}'
	echo "----------------------------------------------------------------------------------------------------------"

	echo -e "\033[1m$arg bucket Total Objects Count\033[0m"
	aws s3 ls s3://$arg --recursive --summarize | grep "Total Objects:"
	echo "----------------------------------------------------------------------------------------------------------"

	echo -e "\033[1m$arg bucket Total Objects Size\033[0m"
	aws s3 ls s3://$arg --recursive --summarize | grep "Total Size:"
	echo "----------------------------------------------------------------------------------------------------------"

	echo -e "\033[1m$arg bucket belong to AWS Region\033[0m"
	aws s3api get-bucket-location --bucket $arg --output text
	echo "----------------------------------------------------------------------------------------------------------"

	#aws s3api list-objects --bucket $arg --query "[sum(Contents[].Size), length(Contents[])]" | awk 'NR!=2 {print $0;next} NR==2 {print $0/1024/1024/1024" GB"}' 
	echo -e "\033[1m$arg bucket Total Size in MB\033[0m"
	aws s3 ls s3://$arg --recursive | awk 'BEGIN {total=0}{total+=$3}END{print total/1024/1024" MB"}'
	echo "----------------------------------------------------------------------------------------------------------"

	echo -e "\033[1m$arg bucket Total Size in GB\033[0m"
	aws s3 ls s3://$arg --recursive | awk 'BEGIN {total=0}{total+=$3}END{print total/1024/1024/1024" GB"}'
done
