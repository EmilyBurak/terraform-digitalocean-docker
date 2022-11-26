# Terraform Setup DigitalOcean Droplet With Docker

## Introduction & Goals

I wanted to run a Dockerized script cheaply on the cloud, and DigitalOcean seemed like a good way to go about that.
As an infrastructure geek, I wanted to be able to setup, modify and tear down the infra with Terraform, my favorite
IaC tool. After going through the documentation and working through its steps manually from DigitalOcean and Hashicorp, I translated those steps to Terraform.

## Technologies Used

- Terraform
- Cloud-config

## Architecture Diagram (if any) / Infrastructure

- DigitalOcean droplet with accompanying SSH key running Docker

## How It Works (High-Level)

- Terraform creates and is used to manage a DO Droplet with an accompanying SSH key.

## Pre-reqs

- Terraform installed

## How To Use

- Clone this repo
- Generate an SSH key named `tf-digitalocean"`(or change the keyname in the TF):
  `ssh-keygen -t rsa -C "your-email-here" -f ./tf-digitalocean`
- Insert the public SSH key (`tf-digitalocean.pub`) into `ssh_authorized_keys` in `cloud-init-data.yaml`

## TO DOs

- [Install Docker with Ansible](https://www.digitalocean.com/community/tutorials/how-to-use-ansible-to-install-and-set-up-docker-on-ubuntu-18-04)
- Update to Ubuntu 20.04
- Automate the SSH key generation fully
- Add a proper firewall and other security improvements.
- Add accompanying VPC at same point.

## Lessons Learned / Observations

- This was my first time working with TF and DO, I found it pretty streamlined like the rest of working with DO.
- Became more familiar with cloud-init, which was the most crunchy part of the process -- seemed hard to debug
  between the log files either being too verbose or not verbose enough. I'd rather use Ansible or even a TF provisioner, maybe Packer or the like for a custom image.
- Realized the cloud-init docs for cloud-config are pretty uninformative.
- Didn't use the CLI for DO, going to try and use it moving forward, but very little needed to be done in the UI at all.
- Learned some best practices for setting up DO servers by going through the docs.

## References

https://developer.hashicorp.com/terraform/tutorials/applications/digitalocean-provider
https://www.digitalocean.com/community/tutorials/how-to-use-cloud-config-for-your-initial-server-setup
https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-22-04
