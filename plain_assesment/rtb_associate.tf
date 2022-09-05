# Creating a resource for the Route Table Association!
resource "aws_route_table_association" "rt_ig_association" {

  depends_on = [
    aws_vpc.my_vpc,
    aws_subnet.public_subnet,
    aws_subnet.private_subnet,
    aws_route_table.public_subnet_rt
  ]

  # Public Subnet ID
  subnet_id = aws_subnet.public_subnet.id

  #  Route Table ID
  route_table_id = aws_route_table.public_subnet_rt.id
}