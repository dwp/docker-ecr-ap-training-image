import boto3
import os
import urllib.request


bucket = os.environ["DEST_BUCKET"]


image_url = "http://download.companieshouse.gov.uk/Accounts_Bulk_Data-2022-02-05.zip"
response = urllib.request.urlopen(image_url)
image = response.read()
filename = "dnldfile.zip"
with open(filename, "wb") as file:
    file.write(image)

s3_client = boto3.client('s3')

response = s3_client.upload_file(filename, bucket, filename)


