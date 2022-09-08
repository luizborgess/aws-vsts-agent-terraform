terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "VSTS-Instances" {
  count         = var.instance_count
  ami           = var.ami
  instance_type = var.instance_type
  key_name= var.key_name
  subnet_id = var.subnet_id
  associate_public_ip_address = true

  user_data = <<-EOF
		#!/bin/bash
    mkdir ~/Agente && cd ~/Agente
    wget https://vstsagentpackage.azureedge.net/agent/2.210.0/vsts-agent-linux-x64-2.210.0.tar.gz
    tar zxvf ./vsts-agent-linux-x64-2.210.0.tar.gz
    export AGENT_ALLOW_RUNASROOT="1"
    ./config.sh --unattended --url ${var.organization} --auth pat --token ${var.pat} --pool ${var.pool} --agent Agent-${count.index + 1} --acceptTeeEula
    sudo ./svc.sh install
    sudo ./svc.sh start
	EOF
  
  vpc_security_group_ids      = [var.aws_security_group]

  root_block_device {
    volume_size           = var.disk_volume_size
    volume_type           = "gp2"
    delete_on_termination = true
  }

  tags = {
    Name  = "Agent-${count.index + 1}"
  }
}