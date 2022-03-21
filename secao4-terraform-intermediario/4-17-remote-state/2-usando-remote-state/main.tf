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

  backend "s3" {}

}

#Setando meu provider, que seria a AWS
provider "aws" {
  #região da AWS que gostaria de criar meu bucket
  region = var.aws_region

  profile = var.aws_profile

  #Outra forma insegura de se conectar no provedor
  # acess_key = "AKIAUMG6KZJAWMEGT3UF"

  # secret_key = "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"
}