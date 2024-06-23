pipeline {
    agent any
    
    environment {
        SUDO_PASSWORD = credentials('2001huss') // Use Jenkins credentials binding plugin
        PATH = "/usr/local/bin:$PATH" // Add Docker path to Jenkins PATH
    }
    
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/ChakraHs/angular_jenkins_docker.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t testapp-image .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh 'docker run -p 8090:80 testapp-image'
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