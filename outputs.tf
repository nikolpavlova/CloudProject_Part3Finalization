#This file contains the outputs that should be printed if the configuration of the website is successful
output "s3_bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.main.bucket
}


output "cloudfront_url" {
  description = "URL to access the website via CloudFront"
  value       = "https://${aws_cloudfront_distribution.main.domain_name}/"
}
