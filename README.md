### databricks data platform

I am building this project to get some hands on experience with the core tools used in data engineering teams.

It’s a small end to end pipeline where I provision Azure resources using Terraform, store data from Kaggle in Azure Blob, then load the data into Databricks, transform it with PySpark and SQL, and turn it into something that can actually be used for analytics.

In Azure, to store raw files from Kaggle we need to create:

1. Azure Subscription
2. Azure Resource Group
3. Azure Storage Account
4. Azure Container (Inside the Storage Account)

#### steps

#### 1. terraform

I wanted to use terraform to set up all my infrastructure for Azure and Databricks using Infrastructure As Code (IAC).
I have decided to keep it simple, but also incorporate some best practices into my terraform scripts. Using Modules, I can set an abstract 'template' of what each resource should look like. So that, in the future I can re-use these modules to create more infrastrucute.

This is file structure I have opted for:

terraform/
├── main.tf
├── variables.tf  
├── outputs.tf
├── modules/
│ ├── resource_group/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ ├── storage_account/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf

To get started:

1. Install the Azure CLI, if you haven't already.
   brew install azure-cli

2. Log into the Azure CLI.
   az login

3. This is to check that you have done it correctly.
   az account show -o table
   or
   -o tells the azure CLI to print the output as tab seperated values instead of JSON.
   az account get-access-token --query exiresOn -o tsv

   \*Note, to log out you can use this command.
   az logout

4. Export the subsciption ID in the same shell, for the azure provider to use.
   export ARM_SUBSCRIPTION_ID=$(az account show --query id -o tsv)

5. Now you can run
   terraform init
   - initializes the backend, modules, provider plugins
   - creates a lock file `.terraform.lock.hcl` to record the provider selections. \*keep in repo

   terraform plan
   - uses the providers to generate an execution plan
   - telling you what actions terraform will perform

   terraform apply
   - telling you what actions terraform will perform
   - you confirm with "yes"
   - will create the resource and show the outputs

   Databricks infra:
   Azure creates the databricks workspace resources, databricks manages the workspace internals
   We will use azurerm for providing the Azure databricks workspace itself
   We will use databricks for providing the internals like (clusters, notebooks, ect)
   An important note, we are logging into and authenticating into databricks via Azure storage account.
   Meaning that it is tied to my subscription in Azure.

   Azure Databricks != Datbricks \*Talk about this in my post

   We will use the Databricks Access Connector to bridge the data between Azure and Databricks
   We need to again make sure that the access connector has "Storage Blob Data Contributor" permissions.
   1. Set up correct permissions in Azure Portal
   1. Go to your storage account
   1. Managed Identities (IAM)
   1. Add +
   1. Storage Blob Data Container
   1. Managed Identity
   1. the databricks access connector

#### 2. upload kaggle dataset to azure blob container

We are using this script to load 2 datasets from kaggle into our Azure Blob Storage Container.
The data relates to Climbing Athletes data from 1991 to 2024, specifically the IFSC World Cup competition data.

ingest_csv_to_blob.py

BlobServiceClient() allows us to manipulate Azure Storage Resources and Blob Containers
ContainerClient() allows us to manipulate Azure Storage Containers and Blob
BlobClient() allows us to manipulate Azure Storage Blob
DefaultAzureCredential() allows us to implement passwordless connection to Azure

1. Set up correct permissions in Azure Portal
   1. Go to your storage account
   2. Managed Identities (IAM)
   3. Add +
   4. Storage Blob Data Container
   5. Assign access to your Microsoft Entra Username

2. Install required python packages
   pip install azure-storage-blob azure-identity

3. Log into Azure CLI
   Passwordless Auth is recommended so we are going to use
   Az login

4. Run python script
   python3 ingest_csv_to_blob.py

You should see something like this:
scripts [main●●] % python3 ingest_csv_to_blob.py
Uploaded Successfully
Uploaded Successfully
