variable "aws_profile_name" {
  type = string
  default = "develop"
}

# Interaction with various services and platforms
provider "aws" {
  profile = var.aws_profile_name
}

# Data block requests read from a given data source (aws_caller_identity)
# and export the result under a given local name (current)
data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "current_region" {
  value = data.aws_region.current.name
}


/*
 *  provider "aws" allow us to interact with the amazon webservice using the account
 *  linked to this machine.
 *  the data block allow us to requests read from a given data source, which in this case
 *  is aws_caller_identity, and we export the result under a given local name as current.
 *  This should be the same as aws_region and current where aws_region is the region 
 *  the machine's region is set in and aws_caller_identity is the machine's identity.
 *
 */
