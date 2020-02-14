#!/bin/bash
sudo yum install wget unzip -y
sudo wget https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip
sudo unzip terraform_0.11.14_linux_amd64.zip
sudo mv terraform /bin
