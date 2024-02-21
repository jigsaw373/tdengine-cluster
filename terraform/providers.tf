terraform {
  backend "s3" {
    bucket                 = "edgecom-prod-tf-states"
    key                    = "terraforms/tdengine-cluster/terraform.tfstate"
    region                 = "ca-central-1"
    skip_region_validation = true
    profile                = "edgecom-prod"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.37.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile
}
