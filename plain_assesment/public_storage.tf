### create storage for the public ec2
resource "aws_ebs_volume" "public_data_vol" {
  availability_zone = "eu-west-2a"
  size              = 1
  encrypted         = true
  tags = {
    Name = "public-volume"
  }

}


# attach the encripted storage to public ec2
resource "aws_volume_attachment" "public-vol" {
  device_name = "/dev/sdc"
  volume_id   = aws_ebs_volume.public_data_vol.id
  instance_id = aws_instance.public_ec2.id
}