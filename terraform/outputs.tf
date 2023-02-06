#load balancer outputs
output "lb_target_group_arn" {
  value = aws_lb_target_group.alb_target_group.arn  
}

output "lb_dns_name" {
  value = aws_lb.custom_lb.dns_name 
}

output "lb_zone_id" {
  value = aws_lb.custom_lb.zone_id 
}



#create file for ansible
resource "local_file" "host_inventory" {
  content = <<EOT
    [webservers:vars]
    ansible_ssh_private_key_file=~/.ssh/instance-key.pem

    [webservers]
    ${ aws_instance.web_instance1.public_ip }
    ${ aws_instance.web_instance2.public_ip }
    ${ aws_instance.web_instance3.public_ip }
    EOT
  filename = "/vagrant/terraform_mini_project/ansible/host_inventory"
}