
# Creating an AWS instance for private ec2
resource "aws_instance" "private_ec2" {
  depends_on = [
    aws_instance.private_ec2,
  ]

  # Using redhat

  ami           = var.ami
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet.id

  # Keyname and security group are obtained from the reference of their instances created above!
  key_name = "my_public_key"

  # Attaching 1 security groups here  for the private instance access by the public instance,

  vpc_security_group_ids = [aws_security_group.private_sg.id]

  tags = {
    Name = "Private_ec2_From_Terraform"
  }
}