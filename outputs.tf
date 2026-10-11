
output "web_server_ip" {
  description = "Public floating IP address of the web server"
  value       = openstack_networking_floatingip_v2.web.address
}

output "web_server_url" {
  description = "URL of the web server homepage"
  value       = "http://${openstack_networking_floatingip_v2.web.address}"
}

output "web_server_ssh_command" {
  description = "SSH command to connect to the web server"
  value       = "ssh -i ~/.ssh/week7_ed25519 ubuntu@${openstack_networking_floatingip_v2.web.address}"
}
