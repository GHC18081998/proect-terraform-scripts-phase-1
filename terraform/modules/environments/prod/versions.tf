terraform {
  required_version = ">= 1.7.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.40"
    }
  }

  backend "s3" {
    bucket         = "myproject-terraform-state-274089075418"
    key            = "networking/test/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "myproject-terraform-state-lock"
    encrypt        = true
    kms_key_id     = "alias/myproject-terraform-state"
  }
}
