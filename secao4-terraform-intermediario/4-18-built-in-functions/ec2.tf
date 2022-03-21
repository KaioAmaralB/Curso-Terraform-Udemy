resource "aws_instance" "server" {

# O count é uma propriedade especial do terraform que serve para controlar a quantidade de instâncais criadas
    count = local.instance_number < 0 ? 0 : local.instance_number

    ami = var.instance_ami

    instance_type = lookup(var.instance_type, var.env)

    tags = merge(

        local.common_tags,

        {

            Project = "Curso AWS com Terraform"
            
            #Formatando, com o %s de string para o valor do var.env
            Env = format("%s", var.env)

            #Formatando, com o %d de number para o valor do count + 1
            Name = format("Instance %d", count.index + 1)

        }

    )

}