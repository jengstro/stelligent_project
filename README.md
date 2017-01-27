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

You will need to set your AWS credentials.

```bash
export AWS_ACCESS_KEY_ID=XXXXXXXXXXXXXXXXXXXX
export AWS_SECRET_ACCESS_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
export AWS_REGION=xx-yyyy-0
```

## Building a new artifact

Use packer to generate a new AMI.

     cd packer
     ./build_ami

## Update terraform variables as needed

    cd terraform
    vi variables.tf

The following variables should be updated at a minimum, prior to stack creation...
    key_name
    hosted_zone
    dns_record

## Verify stack configuration

    cd terraform
    ./plan_stack

## Deploying the latest artifact to AWS

Use terraform to deploy the latest AMI to AWS.

     cd terraform
     ./init_stack

## Destroying your stack

    cd terrform
    ./destroy_stack
