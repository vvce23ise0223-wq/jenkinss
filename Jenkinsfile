pipeline {
    agent any

    environment {
        IMAGE_NAME = "appuraki/demo-app"
    }

    stages {

        stage('Clone Code') {
            steps {
                git 'https://github.com//Docker.git'
            }
        }

        stage('Build Java App') {
            steps {
                sh 'javac demo.java'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:latest")
                }
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
