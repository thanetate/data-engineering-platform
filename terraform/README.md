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

We are also going to use an `environments` folder, to keep each environment isolated and maintain best practices.

/environments/dev - is where i will run terraform init/plan/apply.

It will also wire all the modules together like:
module "resource_group" {
source = "../../modules/resource_group"
name = var.resource_group_name
location = var.location
}

We need to make sure that `AzureRM` is enabled, this will allow us to sign into azure in our terminal to get all of the required credentials. We will use the CLI instead of other solutions.

Before running Terraform commands, log into Azure CLI using:
az login
or
az account set --subscription "NAME or ID"
