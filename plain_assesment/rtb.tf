
# Creating an Route Table for the public subnet!
resource "aws_route_table" "public_subnet_rt" {
  depends_on = [
    aws_vpc.my_vpc,
    aws_internet_gateway.Internet_Gateway
  ]

  # VPC ID
  vpc_id = aws_vpc.my_vpc.id

  # NAT Rule
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Internet_Gateway.id
  }

  tags = {
    Name = "RouteTable"
  }
}