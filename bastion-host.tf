data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "vprofile-bastion" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t3.micro"
  key_name        = aws_key_pair.my_key_pair.key_name
  subnet_id       = module.vpc.public_subnets[0]
  count           = var.instance_count
  security_groups = [aws_security_group.bastion_sg.id]

  tags = {
    Name    = "vprofile-bastion"
    project = var.PROJECT
  }

    provisioner "file" {
    content = templatefile("templates/db-deploy.tmpl", { rds-endpoint =aws_db_instance.vpro_rds_instance.address, dbuser = var.dbuser, dbpass = var.dbpass })
    destination = "/tmp/db-deploy.sh"
  }

  connection {
    type        = "ssh"
    user        = var.USERNAME
    private_key = file("bastion-key")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/db-deploy.sh",
      "sudo /tmp/db-deploy.sh"
    ]
  }


}