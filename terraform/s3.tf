resource "aws_s3_bucket" "tdengine_backup" {
  bucket = "tdengine-backup"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name        = var.bucket_name
    Environment = "Production"
    Terraform = "true"
  }
}