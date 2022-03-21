# Nossos usuários da nossa conta
resource "aws_iam_user" "the-accounts" {

  # Chave e valor são iguais, e é criado em sequência por consequência do for each
  for_each = toset(["Todd", "James", "Alice", "Dottie"])

  name = each.key

}