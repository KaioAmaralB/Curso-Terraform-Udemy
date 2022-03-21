locals {

    # O lookup serve para "conferir" a quantidade de um atributo dentro de uma varíavel
    instance_number = lookup(var.instance_number, var.env)

    file_ext = "zip"
    object_name = "meu-arquivo-gerado-de-um-template"

    common_tags = {

        "Owner" = "Kaio Bispo"

        "Year" = "2022"


    }

}