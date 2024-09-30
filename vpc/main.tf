##We will create 1 vpc , 1 subnet and 1 security group


# A VPC is a private, isolated section of the AWS cloud where you can launch resources
resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true

    tags = {
        Name = "myvpc"

    }
  
}


#A subnet is a division of a VPC that defines a range of IP addresses.
resource "aws_subnet" "pb_sn" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    availability_zone = "eu-north-1a"


    tags = {
        Name = "pb_sn1"
    }


}


#A security group is a virtual firewall that controls inbound and outbound traffic to resources within a VPC.
resource "aws_security_group" "sg" {
    vpc_id = aws_vpc.myvpc.id
    name = "my_sg"
    description = "Public Security"


    # Ingress refers to incoming traffic to a resource within the VPC. It specifies which ports and protocols can be accessed from outside the VPC.
    #This rule allows inbound SSH traffic (port 22) from any IP addres
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }


    #Egress refers to outgoing traffic from a resource within the VPC. It specifies which ports and protocols can be accessed from within the VPC

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"    #This specifies that the rule applies to all protocols (TCP, UDP, ICMP, etc.).
        cidr_blocks = ["0.0.0.0/0"]    #This indicates that the rule applies to all destination IP addresses (the entire internet     
    }
  
}


#In essence, this rule grants the security group complete outbound connectivity, allowing it to communicate with any resource on the internet. This might be useful for certain scenarios, but it's generally considered a security risk as it exposes the resources within the security group to potential threats