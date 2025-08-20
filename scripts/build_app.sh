#!/bin/bash
echo "Building app..."
cd app
npm run build || echo "No build step defined, skipping"