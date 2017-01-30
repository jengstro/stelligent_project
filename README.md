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

AWS EC2 key pair and a route53 hosted zone.

packer - https://www.packer.io/intro/getting-started/setup.html

terraform - https://www.terraform.io/intro/getting-started/install.html

You will also need to make sure to set your AWS credentials.  You can do so via environment variables...

```bash
export AWS_ACCESS_KEY_ID=XXXXXXXXXXXXXXXXXXXX
export AWS_SECRET_ACCESS_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
export AWS_REGION=xx-yyyy-0
```
via the AWS credentials file...

```bash
vi ~/.aws/credentials
  [default]
  output = json
  region = us-west-2
  aws_access_key_id = XXXXXXXXXXXXXXXXXXXX
  aws_secret_access_key = xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

or via aws profiles (http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-multiple-profiles)
```bash
~/.aws/credentials

[default]
aws_access_key_id=AKIAIOSFODNN7EXAMPLE
aws_secret_access_key=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY

[user2]
aws_access_key_id=AKIAI44QH8DHBEXAMPLE
aws_secret_access_key=je7MtGbClwBF/2Zp9Utk/h3yCo8nvbEXAMPLEKEY
```
```bash
~/.aws/config

[default]
region=us-west-2
output=json

[profile user2]
region=us-east-1
output=text
```

## Quickstart

This is the fastest way to a running web app.  This script will create an AMI and launch the app cluster.

  git clone https://github.com/jengstro/stelligent_project.git
  cd stelligent_project
  ./start_app "YOUR_KEY_PAIR" "YOUR_HOSTED_ZONE_ID" "YOUR_DNS_NAME" "YOUR_AWS_PROFILE"

## Building a new artifact

Use packer to generate a new AMI.

     cd packer
     ./build_ami "key_name" "hosted_zone_id" "dns_record" (eg.. ./init_stack jengstro Z1FGPYB4OUXXN0 stelligent.calms-dev.org jengstro)

## Update terraform variables as needed

    cd terraform
    vi variables.tf

## Verify stack configuration

    cd terraform
    ./plan_stack "key_name" "hosted_zone_id" "dns_record" (eg.. ./init_stack jengstro Z1FGPYB4OUXXN0 stelligent.calms-dev.org jengstro)

## Deploying the latest artifact to AWS

Use terraform to deploy the latest AMI to AWS.  Replace key_name, hosted_zone_id and dns_record with values specific to your AWS account.

     cd terraform
     ./init_stack "key_name" "hosted_zone_id" "dns_record" (eg.. ./init_stack jengstro Z1FGPYB4OUXXN0 stelligent.calms-dev.org jengstro)

## Destroying your stack

    ./stop_app "YOUR_AWS_PROFILE"
