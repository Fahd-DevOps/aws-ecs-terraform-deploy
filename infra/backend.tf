terraform {
  backend "s3" {
    bucket         = "terraform-tfstate-01"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-tfstate"
  }
}
