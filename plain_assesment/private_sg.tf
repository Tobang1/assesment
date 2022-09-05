# Creating security group for MySQL, this will allow access only from the instances having the security group created above.
resource "aws_security_group" "private_sg" {

  depends_on = [
    aws_vpc.my_vpc,
    aws_subnet.public_subnet,
    aws_subnet.private_subnet,
    aws_security_group.public_sg
  ]

  description = "Access only from the public sg Instances!"
  name        = "private sg"
  vpc_id      = aws_vpc.my_vpc.id

  # Created an inbound rule for MySQL
  ingress {
    description     = "ssh access from public sg instance"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.public_sg.id]
  }

  # Created an inbound rule for MySQL
  ingress {
    description     = "http accesss from public sg"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.public_sg.id]
  }

  egress {
    description = "outbound  from private instance "
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}