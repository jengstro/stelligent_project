#!/usr/bin/env bash

cd ~



# Create a move into directory.

mkdir terraform_0_8_4

mkdir packer_0_12_1



cd ~/terraform_0_8_4



# Download Terraform. URI: https://www.terraform.io/downloads.html

curl -O https://releases.hashicorp.com/terraform/0.8.4/terraform_0.8.4_linux_amd64.zip

# Unzip and install

unzip terraform_0.8.4_linux_amd64.zip



cd ~/packer_0_12_1



# Download Packer. URI: https://www.packer.io/downloads.html

curl -O https://releases.hashicorp.com/packer/0.12.1/packer_0.12.1_linux_amd64.zip

# Unzip and install

unzip packer_0.12.1_linux_amd64.zip



echo '

# Terraform & Packer Paths.

export PATH=~/terraform_0_8_4:~/packer_0_12_1/:$PATH

' >>~/.bash_profile



source ~/.bash_profile



# verify we're all set to terraform and packer.

terraform

packer
