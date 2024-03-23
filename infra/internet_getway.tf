resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.test_vpc.id
  tags = {
    Name = "terraform gw"
  }
}