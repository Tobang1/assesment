
# Creating an AWS instance for the Webserver!
resource "aws_instance" "public_ec2" {

  depends_on = [
    aws_vpc.my_vpc,
    aws_subnet.public_subnet,
    aws_subnet.private_subnet,
  ]

  # AMI ID [I have used my custom AMI which has some softwares pre installed]
  ami           = "ami-035c5dc086849b5de"
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

  # Installing required softwares into the system!
  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("~/.ssh/id_rsa")    #aws_key_pair.key_pair.id
    host = aws_instance.public_ec2.public_ip
  }

  # Code for installing the softwares!
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install php php-mysqlnd httpd -y",
      "wget https://wordpress.org/wordpress-4.8.14.tar.gz",
      "tar -xzf wordpress-4.8.14.tar.gz",
      "sudo cp -r wordpress /var/www/html/",
      "sudo chown -R apache.apache /var/www/html/",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
      "sudo systemctl restart httpd"
    ]
  }
}