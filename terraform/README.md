### Terraform Docs

To download Terraform on macOS -
brew install hashicorp/tap/terraform # install terraform from github repo

To download Azure CLI on macOS -
brew install azure-cli

We are going to use `modules`, which are reusable infra components.

Modules allow us to not re-write the same Terraform resources over and over. Modules let us define infrastructure components once and reuse them multiple times. Benefits are DRY (don't repeat yourself), consistency across environments, and faster setup / easier scaling. Each Module will have 1 responsibility.

Example Module Structure:

modules/
├── vpc/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
└── ec2/
├── main.tf
├── variables.tf
└── outputs.tf

We will run all the terraform init, plan, apply in the main terraform folder.

It will also wire all the modules together like:
module "resource_group" {
source = "../../modules/resource_group"
name = var.resource_group_name
location = var.location
}

We need to make sure that `AzureRM` is enabled, this will allow us to sign into azure in our terminal to get all of the required credentials. We will use the CLI instead of other solutions.

Before running Terraform commands, log into Azure CLI using:
az login

az account show -o table

The azure CLI is tied to the user session, so navigation does not affect its reach.
You can check its expiry date by
az account get-access-token --query exiresOn -o tsv
You can log out by
az logout

-o tells the azure CLI to print the output as tab seperated values instead of JSON.
