### Data Engineering Platform (Azure, Databricks, PySpark)

I’ve been working in the data engineering space for about a year and wanted to deepen my understanding of modern tools like Azure, Databricks, Apache Spark (PySpark), and Terraform. That’s why I built a small end-to-end data engineering pipeline that simulates a real-world production workflow.

#### 1. Infrastructure with Terraform

Provisioned Azure resources using Infrastructure as Code (IaC):

1. Azure Resource Group
1. Azure Storage Account
1. Azure Databricks Access Connector
1. Azure Databricks Workspace

I opted for a modular structure to better organize and reuse Terraform scripts:

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

1. Install the Azure CLI (if you haven't already):

   ```bash
   brew install azure-cli
   ```

2. Log in:

   ```bash
   az login
   ```

3. Verify login:

   ```bash
   az account show -o table
   # or
   az account get-access-token --query exiresOn -o tsv
   # -o outputs results as tab-separated values
   ```

4. Export your subscription ID:

   ```bash
   export ARM_SUBSCRIPTION_ID=$(az account show --query id -o tsv)
   ```

5. Run Terraform:

   ```bash
   terraform init   # Initializes backend, modules, and providers
   terraform plan   # Shows execution plan
   terraform apply  # Creates resources and outputs results
   ```

#### 2. Cloud Storage Layer

Used a Python script to ingest datasets from Kaggle into an Azure Data Lake Storage Gen2 container.

The dataset contains climbing athlete data from 1991 to 2024, specifically IFSC World Cup competition data.

Script:

```text
ingest_csv_to_blob.py
```

#### 3. Azure to Databricks Integration

Configured an Azure Databricks Access Connector with Unity Catalog to securely access data stored in ADLS Gen2.

Steps:

1. After creating the Access Connector, a system-assigned managed identity is generated.

2. In the Storage Account IAM settings, assign the role:
   "Storage Blob Data Contributor" to the managed identity.

3. In Databricks, create a credential in Unity Catalog to link the connector.

Architecture flow:

```text
Databricks → Unity Catalog Credential → Access Connector → ADLS Gen2
```

#### 4. Data Processing & Transformation (Databricks)

Built an ingestion job to load data into Databricks tables, then used PySpark to transform it using a medallion architecture (Bronze, Silver, and Gold).

Finally, created a dashboard to analyze insights from the Gold layer.

### Demo
<img width="1000" height="auto" alt="image" src="https://github.com/user-attachments/assets/dd24e9d3-34a1-4bef-b35c-0fd3d7f3a43e" />
<img width="1000" height="auto" alt="image" src="https://github.com/user-attachments/assets/be4bb474-f4e8-45f2-b835-79655eefb626" />
<img width="1000" height="auto" alt="image" src="https://github.com/user-attachments/assets/3d7b8387-6b0e-4589-bfb2-615313fcd03f" />
