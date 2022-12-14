# Creating a VPC!
resource "aws_vpc" "my_vpc" {

  # IP Range for the VPC
  cidr_block = "192.168.0.0/16"

  # Enabling automatic hostname assigning
  enable_dns_hostnames = true
  tags = {
    Name = "my_vpc"
  }
}