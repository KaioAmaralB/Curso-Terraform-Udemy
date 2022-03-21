#Quando algo se repete muitas vezes ou algo do tipo criamos uma local
locals {

  ip_filepath = "ips.json"

  common_tags = {

    Service = "Curso Terraform"

    ManagedBy = "Terraform"

    Environment = var.environment

    Owner = "Kaio Bispo"

  }

}