# Creating an Internet Gateway for the VPC
resource "aws_internet_gateway" "Internet_Gateway" {
  depends_on = [
    aws_vpc.my_vpc,
    aws_subnet.public_subnet,
    aws_subnet.private_subnet
  ]

  # VPC in which it has to be created!
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "IGW_VPC"
  }
}