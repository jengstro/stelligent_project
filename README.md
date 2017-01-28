[![Build Status](https://img.shields.io/travis/jengstro/stelligent_project.svg)](https://travis-ci.org/jengstro/stelligent_project)

Stelligent Mini Project

## Description

Installs/configures nginx and deploys a static index.html file via Puppet.

## Testing
You can run specs in  this module with rspec:

     bundle install
     bundle exec rake spec

## Supported version

Ruby 1.9.3-p194

## Prerequisites

EC2 key pair
route53 hosted zone

packer - https://www.packer.io/intro/getting-started/setup.html

terraform - https://www.terraform.io/intro/getting-started/install.html

You will also need to set your AWS credentials.

```bash
export AWS_ACCESS_KEY_ID=XXXXXXXXXXXXXXXXXXXX
export AWS_SECRET_ACCESS_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
export AWS_REGION=xx-yyyy-0
```
Note: Terraform doesn't currently support aws cli profiles.  You can read about what they support here...  https://www.terraform.io/docs/providers/aws/

## Quickstart

This is the fastest way to a running web app.  This script will create an AMI and launch the app cluster.

  git clone https://github.com/jengstro/stelligent_project.git
  cd stelligent_project
  ./start_app

## Building a new artifact

Use packer to generate a new AMI.

     cd packer
     ./build_ami

## Update terraform variables as needed

    cd terraform
    vi variables.tf

## Verify stack configuration

    cd terraform
    ./plan_stack

## Deploying the latest artifact to AWS

Use terraform to deploy the latest AMI to AWS.  Replace key_name, hosted_zone_id and dns_record with values specific to your AWS account.

     cd terraform
     ./init_stack "key_name" "hosted_zone_id" "dns_record" (eg.. ./init_stack jengstro Z1FGPYB4OUXXN0 stelligent.calms-dev.org)

## Destroying your stack

    ./stop_app
