resource "aws_route_table_association" "az1-sub-plc" {
  subnet_id      = aws_subnet.test_subnet.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "az2-sub-plc" {
  subnet_id      = aws_subnet.test_subnet_2.id
  route_table_id = aws_route_table.public-rt.id
}