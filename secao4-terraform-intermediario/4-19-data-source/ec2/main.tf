#Fixando a versão do Terraform
terraform {

  required_version = "1.1.6"

  #Fixando a versão do providers
  required_providers {

    aws = {

      source = "hashicorp/aws"

      version = "4.2.0"

    }

  }

  backend "s3" {

    bucket = "tfstate-301113985601"

    key = "dev/03-data-sources-s3/terraform.tfstate"

    region = "sa-east-1"

    profile = "default"

}

}


#Setando meu provider, que seria a AWS
provider "aws" {
  #região da AWS que gostaria de criar meu bucket
  region = var.aws_region

  profile = var.aws_profile

}