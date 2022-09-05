
variable "key_path" {
  description = "Aws local key path"
  default     = "~/.ssh/id_rsa.pub"

}


variable "aws_region" {
  description = "EC2 Region for the VPC"
  default     = "eu-west-2"
}

variable "amis" {
  description = "AMIs by region"
  default = {
    eu-west-2 = "ami-f1810f86" # ubuntu 14.04 LTS
  }
}

variable "vpc_cidr" {
  description = "CIDR for the whole VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the Public Subnet"
  default     = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for the Private Subnet"
  default     = "10.0.1.0/24"
}

variable "encrypted" {
  default = true
}