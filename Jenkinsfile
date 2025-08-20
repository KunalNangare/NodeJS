pipeline {
    agent any

    environment {
        APP_NAME = "nodejs-app"
        APP_DIR = "app"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/yourusername/nodejs-ci-cd.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh './scripts/install_dependencies.sh'
            }
        }

        stage('Build') {
            steps {
                sh './scripts/build_app.sh'
            }
        }

        stage('Deploy') {
            steps {
                sh './scripts/deploy_app.sh'
            }
        }

        stage('NGINX & SSL Setup') {
            steps {
                sh './scripts/setup_nginx_ssl.sh'
            }
        }

        stage('Monitoring') {
            steps {
                echo "Monitoring script can be run separately or integrated with Prometheus/Grafana"
            }
        }
    }

    post {
        success {
            echo "✅ CI/CD pipeline completed successfully!"
        }
        failure {
            echo "❌ Pipeline failed!"
        }
    }
}