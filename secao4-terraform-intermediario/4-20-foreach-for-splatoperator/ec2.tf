# Pegando da AWS uma imagem com os seguintes requisitos
data "aws_ami" "ubuntu" {

  owners = ["amazon"]

  most_recent = true

  name_regex = "ubuntu"

  filter {

    name = "architecture"

    values = ["x86_64"]

  }

}

# Setando nossas instâncias com os for_each que irá percorrer por cada valor
resource "aws_instance" "instance-course" {

  for_each = {

    web = {

      name = "Web server"

      type = "t2.micro"

    }

    ci_cd = {

      name = "CI/CD server"

      type = "t2.micro"

    }

  }

  ami = data.aws_ami.ubuntu.id

  # O lookup eu peço para resgatar o valor do each,na chave key (irá passar por cada valor)
  instance_type = lookup(each.value, "type", null)

  tags = {

    Project = "Curso AWS com Terraform"

    Name = "${each.key}: ${lookup(each.value, "name", null)}"

    Lesson = "Foreach, For, Splat"

  }

}