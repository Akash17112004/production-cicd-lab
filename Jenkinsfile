pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                bat 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                bat 'npm test'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t app:jenkins .'
            }
        }

        stage('Run Container') {
            steps {
                bat 'docker stop jenkins-app || exit 0'
                bat 'docker rm jenkins-app || exit 0'
                bat 'docker run -d -p 3001:3000 --name jenkins-app app:jenkins'
            }
        }
    }
}