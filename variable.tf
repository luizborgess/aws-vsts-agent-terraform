variable "ami" {
  description = "Points to ami to be deployed, use the ubuntu based one, at this moment only 20.04 works with VSTS agents. It is recomended to create a custom ami, containing sdks,frameworks,aplications needed to build,compile and deploy your aplications"
  default = "ami-08d4ac5b634553e16"
}

variable "instance_count" {
  description = "VSTS agent count to be deployed like Agent-01 ... Agent-n."
  default = 3
}

variable "aws_security_group" {
  description = "Desired Security groups that points to choosen vpc and subnet"
  default = "sg-my-security-group"
}

variable "subnet_id" {
  description = "Describe your subnet to vm be attached"
  default =  "subnet-my-subnet" 
} 

variable "instance_type" {
  description = "Desired Instance type"
  default = "t2.micro"
}

variable "aws_region" {
  description = "Desired AWS Region to deploy EC2"
  default = "us-east-1"
}

variable "key_name" {
  description = "Create a previous Key-Pair in aws, Points to the key pair-s name"
  default = "My-Keypair"
}

variable "pool" {
  description="Points to desired Pool in Azure DevOps"
  default = "Default" 
}

variable "pat" {
  description = "Sets your Personal Access Token (Agent use only)" 
  default = "my-pat"
}

variable "organization" {
  description = "Sets your organization url (Agent use only)"
  default = "my-org"
}

variable "disk_volume_size" {
  description = "Define wanted volume size in Gb"
  default =  "10" 
}