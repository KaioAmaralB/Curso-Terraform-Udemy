#Mostra o resultado no terminal
output "bucket_name" {

  value = aws_s3_bucket.bucket-course.bucket

}

output "bucket_arn" {

  value = aws_s3_bucket.bucket-course.arn

}

output "bucket_domain_name" {

  value = aws_s3_bucket.bucket-course.bucket_domain_name

}

output "ips_file_path" {

  value = "${aws_s3_bucket.bucket-course.bucket}/${aws_s3_bucket_object.object-bucket-course.key}"

}