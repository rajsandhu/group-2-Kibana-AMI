source "amazon-ebs" "ubuntu" {
  ami_name = var.ami_name
  instance_type = var.instance_type
  // volume_type = var.volume_type
  // volume_size = var.volume_size
  region = var.region
  source_ami = data.amazon-ami.ubuntu.id
  ssh_username = "ubuntu"
  iam_instance_profile = "instance-profile"
  // iam_instance_profile = data.aws_iam_instance_profile.ec2.name
  vpc_filter {
    filters = {
      "tag:Name" : var.vpc_name
    }
  }
  subnet_filter {
    filters = {
      "tag:Name" : var.subnet_name
    }
  }
}

build {
    name = "ebs-builder"
    sources = ["source.amazon-ebs.ubuntu"]

    provisioner "ansible" {
        playbook_file = "./../ansible/playbook_apache_kibana_ami.yml"
    }
}
