#!/bin/bash

DOMAIN_NAME=$1

sudo apt update
sudo apt install -y nginx

sudo systemctl start nginx
sudo systemctl enable nginx

sudo tee /etc/nginx/sites-available/default > /dev/null <<EOF
server {
    listen 80;
    server_name $DOMAIN_NAME;

    location / {
        proxy_pass http://127.0.0.1:5000;
    }
}
EOF

sudo nginx -t && sudo systemctl reload nginx

