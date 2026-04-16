pipeline {
    agent any

    environment {
        IMAGE_NAME = "appuraki/demo-app"
    }

    stages {
        stage('Clone Code') {
            steps {
                // Jenkins clones automatically, but keeping this is fine.
                git branch: 'main', url: 'https://github.com/vvce23ise0223-wq/jenkinss.git'
            }
        }

        stage('Build Java App') {
            steps {
                bat 'javac Main.java'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Changed tag to match your environment variable for consistency
                bat "docker build -t ${IMAGE_NAME}:latest ."
            }
        }

        stage('Login & Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerID', // Ensure this ID exists in Jenkins Credentials
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {
                    // 1. Switched 'sh' to 'bat'
                    // 2. Windows uses %VAR% for environment variables in 'bat'
                    bat "echo %PASS% | docker login -u %USER% --password-stdin"
                    bat "docker push %IMAGE_NAME%:latest"
                }
            }
        }
    }
}
