# Create a Null Resource and Provisioners
/*
resource "null" "name" {
    depends_on = [module.ec2_public]
  # Connection Block for Provisioners to connect to EC2 Instance
   connection {
    type     = "ssh"
    user     = "ec2-user"
    #password = "${var.root_password}"
    host     = aws_eip.bastion_eip.public_ip
    private_key = file("terraform-key.ppk")
  }

# File Provisioner: Copies the terraform-key.pem file to /tmp/terraform-key.pem
  provisioner "file" {
    source      = "terraform-key.ppk"
    destination = "/tmp/terraform-key.ppk"
  }

# Remote Exec Provisioner: Using remote-exec provisioner fix the private key permissions on Bastion Host
  provisioner "remote-exec" {
    inline = ["sudo chmod 400 /tmp/terraform-key.ppk"]
  }
}

*/
