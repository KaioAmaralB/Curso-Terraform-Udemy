#Fixando a versão do Terraform
terraform {
  required_version = "1.1.6"

  #Fixando a versão do providers
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.2.0"
    }
  }
}

#Setando meu provider, que seria a AWS
provider "aws" {
  #região da AWS que gostaria de criar meu bucket
  region = "sa-east-1"

  #Outra forma insegura de se conectar no provedor
  # acess_key = "AKIAUMG6KZJAWMEGT3UF"

  # secret_key = "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"
}

#Estou criando um recurso, do tipo "aws_s3_bucket" e ele tem o nome "my_test_bucket"
resource "aws_s3_bucket" "my_test_bucket" {
  #Nome do bucket
  bucket = "bucket-terraform-course-udemy"

  #Tags de identificação
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    ManagedBy   = "Terraform"
    Owner       = "Kaio Bispo"
    UpdatedAt   = "2022-02-25"
  }
}

#Estou criando um recurso, do tipo "aws_s3_bucket_acl"  e ele tem o nome de "my_test_bucket_acl"
resource "aws_s3_bucket_acl" "my_test_bucket_acl" {
  #Referência dinâmica para o meu bucket
  bucket = aws_s3_bucket.my_test_bucket.bucket
  #Setando o meu acl
  acl = "private"
}