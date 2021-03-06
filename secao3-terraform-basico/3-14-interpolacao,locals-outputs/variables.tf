variable "environment" {

  type = string

  description = ""

  default = "dev"

}

variable "aws_region" {

  type = string

  description = ""

  default = "sa-east-1"

}

variable "aws_profile" {

  type = string

  description = ""

  default = "default"

}

variable "instance_ami" {

  type = string

  description = ""

  default = "ami-09b5a444e7e7b2428"

}

variable "instance_type" {

  type = string

  description = ""

  default = "t2.micro"

}

variable "instance_tags" {

  type = map(string)

  description = ""

  default = {

    Name = "Ubuntu"

    Project = "Curso AWS com Terraform"

  }

}
