
# Creating Public subnet!
resource "aws_subnet" "public_subnet" {
  depends_on = [
    aws_vpc.my_vpc
  ]

  # VPC in which subnet has to be created!
  vpc_id = aws_vpc.my_vpc.id

  # IP Range of this subnet
  cidr_block = "192.168.0.0/24"

  # Data Center of this subnet.
  availability_zone = "eu-west-2a"

  # Enabling automatic public IP assignment on instance launch!
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet"
  }
}