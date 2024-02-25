variable "instance_type" {
  default = "t3.micro"
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
output "ami"{
  value = data.aws_ami.centos.image_id
}
