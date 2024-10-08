resource "aws_instance" "test-server" {
  ami                    = "ami-0ea3c35c5c3284d82"
  instance_type          = "t3.large"
  key_name               = "mykeyohio"
  vpc_security_group_ids = ["sg-0a374105c538c170f"]

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("./mykeyohio.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = ["echo 'wait to start the instance'"]
  }

  tags = {
    Name = "test-server"
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.test-server.public_ip} > inventory"
  }

  provisioner "local-exec" {
    command = "ansible-playbook /var/lib/jenkins/workspace/Banking-Finance-project/terraform-files/ansibleplaybook.yml"
}
}
