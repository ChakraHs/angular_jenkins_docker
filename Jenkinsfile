pipeline {
    agent any
    stages{
        stage('Clone Repository'){
            steps{
                Default Git 'https://github.com/ChakraHs/angular_jenkins_docker'
            }
        }
        stage('Build Docker Image'){
            steps{
                script {
                    sh 'docker build -t testapp-image .'
                }
            }
        }

        stage('Run Docker Container'){
            steps{
                script {
                    sh 'docker run -p 8090:80 testapp-image .'
                }
            }
        }
    }
}