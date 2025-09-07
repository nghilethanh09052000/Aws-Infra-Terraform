terraform {
  backend "s3" {
    bucket         = "data-terraform-state"
    key            = "aws-glue"
    region         = "ap-southeast-1"
    dynamodb_table = "data-terraform-lock"
  }
}