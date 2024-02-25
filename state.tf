terraform {
  backend "s3" {
    bucket = "terraform-cart"
    key = "roboshop/dev/terraform.tfstate"
    region = "us-east-1"
  }
}