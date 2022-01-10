provider "aws" {
    region     = "eu-west-1"
}

resource "aws_instance" "example_instance" {
    ami           = "${data.aws_ami.latest-ubuntu-18.id}"
    instance_type = "t2.micro"
}

data "aws_ami" "latest-ubuntu-18" {
most_recent = true
owners = ["099720109477"] # Canonical

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}