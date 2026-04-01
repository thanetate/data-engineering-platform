/*
This is where your real values live. 
We can change the region or name later without editing the module.
*/

resource_group_name = "thane-data-dev-rg"
location            = "Central US"

tags = {
  environment = "dev"
  project     = "data-engineering-platform"
  managed_by  = "terraform"
}