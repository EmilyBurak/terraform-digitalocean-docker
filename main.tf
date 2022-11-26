terraform {
  required_version = ">= 1.0.0"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {}

# Create a new SSH key
resource "digitalocean_ssh_key" "tfsshkey" {
  name       = "Tf Test"
  public_key = file("./tf-digitalocean.pub")
}

# Create droplet using SSH key and cloud-config data
resource "digitalocean_droplet" "tfdroplet" {
  image     = "ubuntu-18-04-x64"
  name      = "test-tf-droplet"
  region    = "nyc1"
  size      = "s-1vcpu-1gb"
  user_data = file("cloud-init-data.yaml")
  ssh_keys  = [digitalocean_ssh_key.tfsshkey.fingerprint]
  monitoring = true
}
