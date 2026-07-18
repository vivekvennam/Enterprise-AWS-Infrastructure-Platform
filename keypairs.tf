resource "aws_key_pair" "my_key_pair" {
  key_name   = "bastion-key"
  public_key = file("bastion-key.pub")

}