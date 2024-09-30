
#An AMI (Amazon Machine Image) is a template for creating EC2 instances. It contains the software and configuration information required to launch an instance





resource "aws_instance" "server" {
    ami = "ami-0e5482f75bed66741"
    instance_type = "m5.large"   #free tier limits
    subnet_id = var.sn
    security_groups = [var.sg]

    tags ={
        Name = "myserver"
    }


}