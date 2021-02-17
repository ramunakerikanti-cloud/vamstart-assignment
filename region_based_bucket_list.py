import boto3
import sys

region_name=sys.argv[1]
s3 = boto3.client("s3")
for bucket in s3.list_buckets()["Buckets"]:
        if s3.get_bucket_location(Bucket=bucket['Name'])['LocationConstraint'] == region_name:
                    print(bucket["Name"])
