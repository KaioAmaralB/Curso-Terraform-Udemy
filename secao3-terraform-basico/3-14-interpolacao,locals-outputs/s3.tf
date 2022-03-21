resource "aws_s3_bucket" "bucket-course" {

  bucket = "${random_pet.bucket.id}-${var.environment}"

  tags = local.common_tags

}

# Bucket criado manual que vamos importar para o Terraform
resource "aws_s3_bucket" "manual" {

  bucket = "bucket-course-manual"

  tags = {

    Criado = "05/03/2022"

    Importado = "05/03/2021"

    ManagedBy = "Terraform"

  }

}

resource "aws_s3_bucket_object" "object-bucket-course" {

  bucket = aws_s3_bucket.bucket-course.bucket

  key = "config/${local.ip_filepath}"

  source = local.ip_filepath

  etag = filemd5(local.ip_filepath)

  content_type = "application/json"


  tags = local.common_tags

}

resource "aws_s3_bucket_object" "ramdom-object-bucket-course" {

  bucket = aws_s3_bucket.bucket-course.bucket

  key = "config/${random_pet.bucket.id}.json"

  source = local.ip_filepath

  etag = filemd5(local.ip_filepath)

  content_type = "application/json"


  tags = local.common_tags

}