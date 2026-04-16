pipeline {
    agent any

    environment {
        IMAGE_NAME = "appuraki/demo-app"
    }

    stages {
        stage('Clone Code') {
            steps {
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
                bat 'docker build -t my-app-name .'
            }
        }

        stage('Login & Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerID',
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {
                    sh 'echo $PASS | docker login -u $USER --password-stdin'
                    sh "docker push ${IMAGE_NAME}:latest"
                }
            }
        }
    }
}
