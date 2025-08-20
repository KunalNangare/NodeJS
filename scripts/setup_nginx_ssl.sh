#!/bin/bash

sudo apt update
sudo apt install -y nginx certbot python3-certbot-nginx

sudo tee /etc/nginx/sites-available/nodejs_app <<EOF
server {
    listen 80;
    server_name devlogin.nextastra.com;

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
EOF

sudo ln -s /etc/nginx/sites-available/nodejs_app /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx

sudo certbot --nginx -d devlogin.nextastra.com --non-interactive --agree-tos -m your-email@example.com