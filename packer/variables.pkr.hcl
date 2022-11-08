variable "instance_type" {
    type = string
    description = "source ec2 instance type"
}

variable "iam_instance_profile" {
    type = string
    description = "aws iam instance profile to connect to "
}


variable "region" {
    type = string
    description = "region where to launch source ec2 instance"
}

variable "ami_owner" {
    type = string
    description = "owner of source AMI"
}

variable "ami_name" {
    type = string
    description = "name of the target ami amazon-ebs"
}

variable "source_ami_name" {
    type = string
    description = "source ami-name for datasource amazon-ami"
}

variable "vpc_name" {
    type = string
    description = "name of the vpc"
}

variable "subnet_name" {
    type = string
    description = "name of the subnet"
}

variable "volume_type" {
    type = string
    description = "type of the amazon-ebs volume"
}

variable "volume_size" {
    type = string
    description = "vol_size of the amazon-ebs storage"
}

variable "kibana_deb_file" {
    type = string
    description = "version of the kibana deb file"
}