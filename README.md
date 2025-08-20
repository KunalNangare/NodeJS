# Node.js CI/CD Application

## Objective
Set up a complete CI/CD workflow and deployment pipeline for a Node.js application with secure access and monitoring.

## Setup Steps

1. Clone Repository:
```bash
git clone https://github.com/yourusername/nodejs-ci-cd.git
```

2. Install Dependencies:
```bash
./scripts/install_dependencies.sh
```

3. Build Application:
```bash
./scripts/build_app.sh
```

4. Deploy Application:
```bash
./scripts/deploy_app.sh
```

5. Setup NGINX and SSL:
```bash
./scripts/setup_nginx_ssl.sh
```

6. Monitoring:
```bash
./scripts/monitoring.sh
```

## Jenkins Pipeline
- Pulls code, installs dependencies, builds, deploys with PM2, and sets up NGINX & SSL.

## Security
- Matrix-based security in Jenkins
- Roles: Admin, Developer
- Anonymous access disabled

## Access
- Application URL: `https://devlogin.nextastra.com`