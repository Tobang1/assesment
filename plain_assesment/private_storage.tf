resource "aws_ebs_volume" "private_data_vol" {
 availability_zone = "eu-west-2b"
 size = 1
 encrypted = true
 tags = {
        Name = "private-volume"
 }

}
#
resource "aws_volume_attachment" "private-vol" {
 device_name = "/dev/sdc"
 volume_id = "${aws_ebs_volume.private_data_vol.id}"
 instance_id = "${aws_instance.private_ec2.id}"
}