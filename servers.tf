data "aws_security_group" "allow-all" {
  name = "allow-all"
}
variable "instance_type" {
  default = "t3.micro"
}

variable "components" {
  default = {
    frontend = {
      name = "frontend"
      instance_type = "t3.micro"
    }
    mongodb = {
      name = "mongodb"
      instance_type = "t3.micro"
    }
    catalogue = {
      name = "catalogue"
      instance_type = "t3.micro"
    }
    redis ={
      name = "redis"
      instance_type = "t3.micro"
    }
    user = {
      name = "user"
      instance_type = "t3.micro"
    }
    cart = {
      name = "cart"
      instance_type = "t3.micro"
    }
    mysql = {
      name = "mysql"
      instance_type = "t3.micro"
    }
    shipping = {
      name = "shipping"
      instance_type = "t3.micro"
    }
    rabbitmq = {
      name = "rabbitmq"
      instance_type = "t3.micro"
    }
    payment = {
      name = "payment"
      instance_type = "t3.small"
    }
  }
}

resource "aws_instance" "frontend" {
  for_each = var.components
  ami           = data.aws_ami.centos.image_id
  instance_type = each.value["instance_type"]
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]

  tags = {
    Name = each.value["name"]
  }
}

 data "aws_ami" "centos" {
   most_recent      = true
   name_regex       = "Centos-8-DevOps-Practice"
   owners           = ["973714476881"]
}

output "ami"{
  value = data.aws_ami.centos.image_id
}
