pipeline {
    agent any  // Specify any available agent to run the pipeline
    
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
                    docker.build('testapp-image')  // Using Docker Pipeline Plugin syntax
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    docker.image('testapp-image').run('-p 8090:80')  // Using Docker Pipeline Plugin syntax
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
            // sh 'docker system prune -f'
        }
        success {
            echo 'Build and deployment successful!'
        }
        failure {
            echo 'Build or deployment failed.'
        }
    }
}
