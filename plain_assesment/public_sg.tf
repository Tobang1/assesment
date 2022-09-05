
# Creating a Security Group for public sg
resource "aws_security_group" "public_sg" {

  depends_on = [
    aws_vpc.my_vpc,
    aws_subnet.public_subnet,
    aws_subnet.private_subnet
  ]

  description = "HTTP, SSH"

  # Name of the security Group!
  name = "public_sg"

  # VPC ID in which Security group has to be created!
  vpc_id = aws_vpc.my_vpc.id

  # Created an inbound rule for internet access!
  ingress {
    description = "HTTP for public_sg"
    from_port   = 80
    to_port     = 80

    # Here adding tcp instead of http, because http in part of tcp only!
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Created an inbound rule for SSH
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22

    # Here adding tcp instead of ssh, because ssh in part of tcp only!
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outward Network Traffic for the public ec2
  egress {
    description = "for public sg"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}