### Data Engineering Platform (Azure, Databricks, PySpark)

I’ve been working in the data engineering space for about a year and wanted to deepen my understanding of modern tools like Azure, Databricks, Apache Spark (PySpark), and Terraform. Thats why I built a small end-to-end data engineering pipeline that simulates a real-world production workflow.

#### 1. Infrastructure with Terraform

Provisioned Azure Resources using infrastructure as code (IAC):

1. Azure Resource Group
1. Azure Storage Account
1. Azure Databricks Access Connector
1. Azure Databricks Workspace

I have opted for a module structure, so that I can organize and reuse these terraform scripts.

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

1. Install the Azure CLI, if you haven't already

   ```bash
   brew install azure-cli
   ```

2. Log into the Azure CLI

   ```bash
   az login
   ```

3. Check if it worked

   ```bash
   az account show -o table
   # or
   az account get-access-token --query exiresOn -o tsv
   # -o tells the Azure CLI to print the output as a tab seperated values
   ```

4. Export the subsciption ID in the same terminal window, for the azure provider to use

   ```bash
   export ARM_SUBSCRIPTION_ID=$(az account show --query id -o tsv)
   ```

5. Now you can run

   Initializes the backend, modules, provider plugins.

   Creates a lock file `.terraform.lock.hcl` to record the provider selections.

   ```bash
   terraform init
   ```

   Uses the providers to generate an execution plan.

   Tells you what actions terraform will perform.

   ```bash
   terraform plan
   ```

   Tells you what actions terraform will perform.

   Terraform will create the resource and show the outputs.

   ```bash
   terraform apply
   ```

#### 2. Cloud Storage Layer

We are using this script to load some datasets from kaggle into our Azure Data Lake Storage Gen2 container.
The data relates to climbing athletes data from 1991 to 2024, specifically the IFSC World Cup competition data.

Python script:

```text
ingest_csv_to_blob.py
```

#### 3. Azure to Databricks Integration

Configured an Azure Databricks Access Connector with the Unity Catalog in Databricks to securely access data stored in ADLS Gen2 from my Databricks workspace.

To get started:

1. Once you have created the Azure Databricks Access Connector, it should generate a system-assigned managed identity tied to the access connector.

2. Navigate to your Access Control (IAM) within the Storage Account you created. Assign the role "Storage Blob Data Contributor" to the access connector's managed identity.

3. In your Databricks workspace we need to create a credential within the Unity Catalog. This connects the access connector to the catalog.

```text
Databricks → Unity Catalog Credential → Access Connector → Storage Account (ADLS Gen2)
```

#### 4. Data Processing & Transformation (Databricks)

Built a ingestion job to load data into Databricks tables, then used PySpark to transform it through a medallion architecture (Bronze, Silver, Gold). Finally, I created a dashboard to analyze insights from the Gold layer.

### Demo
