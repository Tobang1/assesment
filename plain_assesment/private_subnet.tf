# Creating private subnet!
resource "aws_subnet" "private_subnet" {
  depends_on = [
    aws_vpc.my_vpc,
    aws_subnet.public_subnet
  ]

  # VPC in which subnet has to be created!
  vpc_id = aws_vpc.my_vpc.id

  # IP Range of this subnet
  cidr_block = "192.168.1.0/24"

  # Data Center of this subnet.
  availability_zone = "eu-west-2b"

  tags = {
    Name = "Private Subnet"
  }
}