# VPC
resource "aws_vpc" "test_vpc" {
  cidr_block           = var.cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    "Name" = "vpc_node_test"
  }
}

# subnet
resource "aws_subnet" "test_subnet" {
  vpc_id                  = aws_vpc.test_vpc.id
  cidr_block              = var.pub_sub_1
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = "true"
  tags = {
    "Name" = "az1_public_subnet"
  }
}
