pipeline {
    agent any

    environment {
        DOCKER_CREDENTIAL_ID = 'Docker'
        IMAGE_NAME = 'appuraki/docker_image'
    }

    stages {

        stage('Build Java Application') {
            steps {
                bat 'javac HelloWorld.java'
            }
        }

        stage('Run Java Program') {
            steps {
                bat 'java HelloWorld'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t $<IMAGE_NAME>:latest ."
            }
        }

        stage('Login to DockerHub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: env.DOCKER_CREDENTIAL_ID,
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {

                    bat "docker login -u %USER% -p %PASS%"
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                bat "docker push $<IMAGE_NAME>:latest"
            }
        }
    }

    post {
        always {
            bat 'docker logout'
        }
    }
}
