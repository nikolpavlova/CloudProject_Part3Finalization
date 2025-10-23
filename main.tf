# This file contains the 6 main features of the configuration


#S3 bucket which hosts the index.html file
resource "aws_s3_bucket" "main" {
  bucket = var.s3_bucket_name


  tags = {
    Name        = "MyBucket"
    Environment = "Production"
  }
}


#Cloudfront distribution which delivers the files fast and globally
resource "aws_cloudfront_origin_access_control" "main" {
  name                              = "s3-cloudfront-oac"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}


#Cache policy
resource "aws_cloudfront_cache_policy" "mywebsite" {
  name    = "cache-policy"
  comment = "Cache policy for the website"


  parameters_in_cache_key_and_forwarded_to_origin {
    cookies_config {
      cookie_behavior = "none"
    }
    headers_config {
      header_behavior = "none"
    }
    query_strings_config {
      query_string_behavior = "none"
    }
  }
}


#Origin which connects the Cloudfront distribution to the S3 bucket
resource "aws_cloudfront_distribution" "main" {
  enabled             = true
  default_root_object = "index.html"
  is_ipv6_enabled     = true
  wait_for_deployment = true


  origin {
    domain_name              = aws_s3_bucket.main.bucket_regional_domain_name
    origin_id                = aws_s3_bucket.main.id
    origin_access_control_id = aws_cloudfront_origin_access_control.main.id
  }


  default_cache_behavior {
    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods  = ["GET", "HEAD"]
    #cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    cache_policy_id        = aws_cloudfront_cache_policy.mywebsite.id
    target_origin_id       = aws_s3_bucket.main.id
    viewer_protocol_policy = "redirect-to-https"
  }


  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  viewer_certificate {
    cloudfront_default_certificate = true
  }


}
#S3 bucket policy
resource "aws_s3_bucket_policy" "main" {
  bucket = aws_s3_bucket.main.id


  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action   = "s3:GetObject"
        Resource = "${aws_s3_bucket.main.arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = aws_cloudfront_distribution.main.arn
          }
        }
      }
    ]
  })
}


#S3 bucket website configuration
resource "aws_s3_bucket_website_configuration" "main" {
  bucket = aws_s3_bucket.main.id


  index_document {
    suffix = "index.html"
  }
}




