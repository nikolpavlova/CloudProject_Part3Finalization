#This file contains all of the main variables
variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "hello-website-deboi"
}


variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}
