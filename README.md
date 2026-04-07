### databricks data platform

I am building this project to get some hands on experience with the core tools used in data engineering teams.

It’s a small end to end pipeline where I provision Azure resources using Terraform, store data from Kaggle in an Azure Data Lake, then load the data into Databricks, transform it with PySpark and SQL, and turn it into something that can actually be used for analytics.

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
