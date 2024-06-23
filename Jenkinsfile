pipeline {
    agent any
    stages{
        stage('Clone Repository'){
            steps{
                git branch: 'main', url: 'https://github.com/ChakraHs/angular_jenkins_docker.git'
            }
        }
        stage('Build Docker Image'){
            steps{
                script {
                    sh '/usr/local/bin/docker build -t testapp-image .'
                }
            }
        }

        stage('Run Docker Container'){
            steps{
                script {
                    sh '/usr/local/bin/docker run -p 8090:80 testapp-image .'
                }
            }
        }
    }


    post {
        always {
            echo 'Cleaning up...'
            sh 'docker system prune -f'
        }
        success {
            echo 'Build and deployment successful!'
        }
        failure {
            echo 'Build or deployment failed.'
        }
    }
}