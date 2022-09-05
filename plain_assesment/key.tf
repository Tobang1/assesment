# Creating a New Key
resource "aws_key_pair" "key_pair" {

  # Name of the Key
  key_name = "my_public_key"

  # Adding the SSH authorized key !
  public_key = file("${var.key_path}")

}