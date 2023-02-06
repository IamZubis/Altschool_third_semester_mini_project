resource "local_file" "instance_IP_addresses" {
    
    content  = <<EOT
${aws_instance.zubis-altschool-webserver1.public_ip}
${aws_instance.zubis-altschool-webserver2.public_ip}
${aws_instance.zubis-altschool-webserver3.public_ip}
  EOT
  filename = "/home/zubis/Altschool Terraform Project/host-inventory"
}
