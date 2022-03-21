# Nos mostra a extensão no terminal
output "extensions" {

    value = local.file_extensions

}

# Nos mostra a extensão no terminal exceto pelo .json e em uppercase
output "extensions_upper" {

    value = local.file_extensions_upper

}

# Nos mostra a arns no terminal
output "instance_arns" {

    value = [for key, v in aws_instance.instance-course : v.arn]

}

# Nos mostra os nomes das instâncias no terminal
output "instance_names" {

    value = {for k, v in aws_instance.instance-course : k => v.tags.Name}

}

# Nos mostra os ips privados no terminal com o for
output "private_ips" {

    value = [for o in local.ips : o.private]

}

# Nos mostra os ips publicos no terminal com o splat
output "public_ips" {

    value = local.ips[*].public

}