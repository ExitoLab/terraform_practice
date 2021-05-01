resource "aws_s3_bucket" "terraform_pratice" {
  bucket = "terraform-practice"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name = "S3 Remote Terraform State Store"
  }
}

resource "aws_s3_bucket_public_access_block" "terraform_practice_policy" {
  bucket                  = aws_s3_bucket.terraform_pratice.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_dynamodb_table" "terraform_practice_locks" {
  name         = "terraform_practice_lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}