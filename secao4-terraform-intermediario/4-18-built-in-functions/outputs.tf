# Quando ele me retornar os ips será como lista, o asterisco serve justamente para ler todos os valores dessa lista
output "instance_public_ips" {
  value = aws_instance.server.*.public_ip
}

# Retorna uma lista de nomes das instâncias criadas
output "instance_names" {
  value = join(", ", aws_instance.server.*.tags.Name)
}