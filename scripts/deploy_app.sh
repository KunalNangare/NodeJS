#!/bin/bash
echo "Starting app..."
cd app
pm2 stop nodejs-app || true
pm2 start index.js --name nodejs-app
pm2 save