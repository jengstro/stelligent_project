Stelligent Mini Project

## Description

Installs/configures nginx and deploys a static index.html file via Puppet.

## Building a new artifact

Use packer to generate a new AMI.

```shell
cd packer
packer build ami.json
```

Update the AMI to the latest in ami.txt.

## Deploying the latest artifact to AWS

Use terraform to deploy the latest AMI to AWS.

```shell
cd terraform
terraform plan -var "ami=`cat ../packer/ami.txt`"
terraform apply -var "ami=`cat ../packer/ami.txt`"
```
