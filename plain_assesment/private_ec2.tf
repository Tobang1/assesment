
# Creating an AWS instance for the MySQL! It should be launched in the private subnet!
resource "aws_instance" "private_ec2" {
  depends_on = [
    aws_instance.private_ec2,
  ]

  # Using my custom Private AMI which has most of the things configured for WordPress
  # i.e. MySQL Installed!
  ami           = "ami-035c5dc086849b5de"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet.id

  # Keyname and security group are obtained from the reference of their instances created above!
  key_name = "my_public_key"

  # Attaching 2 security groups here, 1 for the MySQL Database access by the Web-servers,
  # & other one for the Bastion Host access for applying updates & patches!
  vpc_security_group_ids = [aws_security_group.private_sg.id]

  tags = {
    Name = "Private_ec2_From_Terraform"
  }
}