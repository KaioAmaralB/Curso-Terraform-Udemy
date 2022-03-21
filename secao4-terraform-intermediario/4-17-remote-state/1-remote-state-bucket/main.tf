#Fixando a versão do Terraform
terraform {

  required_version = "1.1.6"

  #Fixando a versão do providers
  required_providers {

    aws = {

      source = "hashicorp/aws"

      version = "4.2.0"

    }

    random = {

      source = "hashicorp/random"

      version = "3.1.0"

    }

  }

}

#Setando meu provider, que seria a AWS
provider "aws" {
  #região da AWS que gostaria de criar meu bucket
  region = var.aws_region

  profile = var.aws_profile

}

# pegando os dados da minhca conta
data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "remote-state" {

  # O bucket irá receber o id da conta como nome concatenado com o tfstate-
  bucket = "tfstate-${data.aws_caller_identity.current.account_id}"

  tags = {

    Description = "Stores terraform remote state files"

    ManagedBy = "Terraform"

    Owner = "Kaio Amaral"

    CreatedAt = "2022-03-07"

  }

}

# Expondo o bucket no terminal
output "remote_state_bucket" {

  value = aws_s3_bucket.remote-state.bucket

}

# Expondo o arn bucket no terminal
output "remote_state_bucket_arn" {

  value = aws_s3_bucket.remote-state.arn

}