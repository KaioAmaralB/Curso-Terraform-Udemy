resource "random_pet" "this" {

    length = 5

}

resource "aws_s3_bucket" "bucket-course" {

    bucket = "my-bucket-${random_pet.this.id}"

}

resource "aws_s3_bucket_object" "bucket-course-object" {

    bucket = aws_s3_bucket.bucket-course.bucket

    key = "instances/instances-${local.instance.ami}.json"

    source = "outputs.json"

    etag = filemd5("outputs.json")

    content_type = "application/json"

}