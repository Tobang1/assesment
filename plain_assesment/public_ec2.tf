
# Creating an AWS instance for the public ec2
resource "aws_instance" "public_ec2" {

  depends_on = [
    aws_vpc.my_vpc,
    aws_subnet.public_subnet,
    aws_subnet.private_subnet,
  ]

  # AMI ID attached to the ec2
  ami           = var.ami
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id

  # Keyname and security group are obtained from the reference of their instances created above!
  # Here I am providing the name of the key which is already uploaded on the AWS console.
  key_name = "my_public_key"

  # Security groups to use!
  vpc_security_group_ids = [aws_security_group.public_sg.id]

  tags = {
    Name = "Public_ec2_From_Terraform"
  }

  # test ssh into the private ec2
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/id_rsa") #aws_key_pair.key_pair.id
    host        = aws_instance.public_ec2.public_ip
  }

  #### update the private instance and remote into it
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
    ]
  }
}