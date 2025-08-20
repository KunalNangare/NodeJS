#!/bin/bash
echo "Monitoring system metrics..."
while true; do
    echo "=== $(date) ==="
    top -b -n1 | head -n 10
    echo "Disk usage:"
    df -h
    echo "Memory usage:"
    free -h
    echo "Node.js process:"
    pm2 list
    sleep 60
done