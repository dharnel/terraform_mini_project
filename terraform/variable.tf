variable "access_key" {
    type = string
    sensitive = true
}

variable "secret_key" {
    type = string
    sensitive = true
}

variable "vpc_block" {
    type = string
    default = "10.0.0.0/16"
}

variable "general_internet_ip" {
    type = string
    default = "0.0.0.0/0"
}

variable "public_ip_address" {
    type = list(string)
    default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "private_ip_address" {
    type = list(string)
    default = ["10.0.3.0/24","10.0.4.0/24"]
}

variable "private_ip_address_nic" {
    type = list(string)
    default = ["10.0.1.10","10.0.2.200"]
}

variable "ipv6_ip" {
    type = string
    default = "::/0"
}

variable "ami_detail" {
    type = string
    default = "ami-0d09654d0a20d3ae2"
}

variable "instance" {
    type = string
    default = "t2.micro"
}

variable "domain_name" {
    type = string
    default = "niellaravelapp.me"
}

variable "site_domain" {
    type = string
    default = "terraform-test.niellaravelapp.me"
}
