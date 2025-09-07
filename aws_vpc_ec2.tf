provider "aws" {
    region = "ap-south-1"
}

resource "aws_vpc" "main" {
    cidr_block           = "10.0.0.0/16"
    enable_dns_support   = true
    enable_dns_hostnames = true

    tags = {
        Name = "main-vpc"
    }
}

resource "aws_subnet" "main" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = "10.0.1.0/24"
    map_public_ip_on_launch = true

    tags = {
        Name = "main-subnet"
    }
}

resource "aws_instance" "my-ec2" {
    ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI for ap-south-1, update as needed
    instance_type = "t2.micro"
    subnet_id     = aws_subnet.main.id

    tags = {
        Name = "my-ec2"
    }
}
