provider "aws" {
	profile = "default"
	region = "us-west-2"
}

variable "ssh_key_private" {
	type = string
	
}

resource "aws_instance" "jripper" {
	ami = "ami-03d5c68bab01f3496"
	instance_type = "t2.nano"
	key_name = "chris2"
	
	tags = {
		project = "JRipper Terraform Ansible"
		
	}
	
	provisioner "remote-exec" {
		inline = ["sudo apt-get install python --yes"]

		connection {
			type        = "ssh"
			user        = "ubuntu"
			private_key = "${file(var.ssh_key_private)}"
			host		= "${self.public_ip}"
			
		}
	}
	
	provisioner "local-exec" {
		command = "ansible-playbook -u ubuntu -i '${self.public_ip},' --private-key ${var.ssh_key_private} jripper.yml" 
		
	}
}


