"""
This script will:
Connect to Azure.
Then it will load 2 csv files 
'athlete_information.csv' and 'athlete_results.csv' 
into our Blob Container 'a00001-container'
"""

from azure.identity import DefaultAzureCredential
from azure.storage.blob import BlobServiceClient

try:
    account_url = "https://dpstoragea00001.blob.core.windows.net"
    default_credentials = DefaultAzureCredential()
    blob_service_client = BlobServiceClient(account_url, credential=default_credentials)
except Exception as e:
    print(f"Could not connect to Azure: {e}")
finally: 
    container_name = "a00001-container"

    files = [
    ("/Users/thanetate/Downloads/athlete_information.csv", "athlete_information.csv"),
    ("/Users/thanetate/Downloads/athlete_results.csv", "athlete_results.csv"),
    ]

    for upload_file_path, blob_name in files:
        # create a blob client using local_file_name as the name for the blob
        blob_client = blob_service_client.get_blob_client(container=container_name, blob=blob_name)
        # upload to Azure Blob Container
        with open (file=upload_file_path, mode="rb") as data:
            blob_client.upload_blob(data)
        print("Uploaded Successfully")