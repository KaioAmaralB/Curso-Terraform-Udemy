variable "env" {

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

# Bloco de validação
  validation {

    # Condição esse length serve para verificar o tamanho da string e o substr ele tira uma parte da string de acordo com esse parametro
    condition = length(var.instance_ami) > 4 && substr(var.instance_ami, 0, 4) == "ami-"

    # Caso tenha algum erro
    error_message = "The instance_ami value must be a valida AMI id, starting with \"ami-\"."

  }

}

# Variavel para o número de instâncias
variable "instance_number" {

    # Tem que seguir esse padrão
    type = object ({

        dev = number

        prod = number

    })

    # Descrição
    description = "Number of instances to create"

    # Valor padrão a ser atribuido
    default = {

        dev = 1

        prod = 3

    }

}


variable "instance_type" {

  type = object ({

      dev = string

      prod = string

  })

  description = ""

  default = {

    dev = "t2.micro"

    prod = "t2.micro"

  }

}