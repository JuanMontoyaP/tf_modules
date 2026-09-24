resource "aws_s3_bucket" "this" {
  bucket           = var.bucket_name
  bucket_namespace = var.bucket_namespace

  force_destroy = var.enable_force_destroy
}
