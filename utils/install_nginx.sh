#!/bin/bash
DOMAIN_NAME=$1

sudo apt update
sudo apt install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx

echo "Nginx installed for domain: $DOMAIN_NAME"
