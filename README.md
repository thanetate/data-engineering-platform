### Data Engineering Platform

I’ve been working in the data engineering space for about a year and wanted to deepen my understanding of modern tools like Azure, Databricks, Apache Spark (PySpark), and Terraform. Thats why I built a small end-to-end data engineering pipeline that simulates a real-world production workflow.

**What I built:**
**1. Infrastructure with Terraform**
Provisioned these Azure Resources using infrastructure as code (IAC):

1. Azure Resource Group
2. Azure Storage Account
3. Azure Databricks Access Connector
4. Azure Databricks Workspace

I have opted for a module like structure, so that we can organize and re-use these terraform scripts.

```text
├── terraform/
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    └── modules/
        ├── resource_group/
        ├── storage_account/
        ├── databricks_workspace/
        └── databricks_access_connector/
```

To get started:

1. Install the Azure CLI, if you haven't already.

   ```bash
   brew install azure-cli
   ```

2. Log into the Azure CLI.

   ```bash
   az login
   ```

3. This is to check that you have done it correctly.

```bash
  az account show -o table
```

or
-o tells the azure CLI to print the output as tab seperated values instead of JSON.

```bash
  az account get-access-token --query exiresOn -o tsv
```

\*Note, to log out you can use this command.

```bash
az logout
```

4. Export the subsciption ID in the same shell, for the azure provider to use.

```bash
   export ARM_SUBSCRIPTION_ID=$(az account show --query id -o tsv)
```

5. Now you can run

```bash
   terraform init
```

- initializes the backend, modules, provider plugins
- creates a lock file `.terraform.lock.hcl` to record the provider selections

```bash
   terraform plan
```

- uses the providers to generate an execution plan
- telling you what actions terraform will perform

```bash
   terraform apply
```

- telling you what actions terraform will perform
- you confirm with "yes"
- will create the resource and show the outputs

**2. Cloud Storage Layer**
We are using this script to load 2 datasets from kaggle into our Azure Blob Storage Container.
The data relates to Climbing Athletes data from 1991 to 2024, specifically the IFSC World Cup competition data.

ingest_csv_to_blob.py

BlobServiceClient() allows us to manipulate Azure Storage Resources and Blob Containers
ContainerClient() allows us to manipulate Azure Storage Containers and Blob
BlobClient() allows us to manipulate Azure Storage Blob
DefaultAzureCredential() allows us to implement passwordless connection to Azure

**3. Azure to Databricks Integration**
Configured an Azure Databricks Access Connector with Unity Catalog to securely access data stored in ADLS Gen2 from my Databricks workspace.

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

**4. Data Processing & Transformation (Databricks)**
Built a ingestion job to load data into Databricks tables and used PySpark to transform it through a medallion architecture (Bronze → Silver → Gold). Finally, I created a dashboard to analyze insights from the Gold layer.

**What I learned:**
The main thing I learned outside of Databricks, Apache Spark (PySpark), and Terraform was cloud security and identity management. I worked with managed identities and learned how they can replace traditional key-based authentication, removing the need for key rotation.

The main thing I learned outside of the basics of Databricks, Apache Spark (PySpark), and Terraform was security and how to provision managed identities. I also learned how managed identies can be used instead of traditional keys which require manual intervention to rotate ect.
