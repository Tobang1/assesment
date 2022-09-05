
variable "key_path" {
  description = "Aws local key path"
  default     = "~/.ssh/id_rsa.pub"

}


variable "aws_region" {
  description = "EC2 Region for the VPC"
  default     = "eu-west-2"
}

variable "ami" {
  description = "AMIs by region"
  default     = "ami-035c5dc086849b5de"
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