pipeline {
    agent any
    stages{
        stage('Hello') {
            steps {
                // Display a message indicating successful Git checkout
                echo 'Hello to jenkins.'
            }
        }
        stage('Clone Repository'){
            steps{
                git branch: 'main', url: 'https://github.com/ChakraHs/angular_jenkins_docker.git'
            }
        }
        stage('Display Message') {
            steps {
                // Display a message indicating successful Git checkout
                echo 'Git checkout successful! Repository cloned.'
            }
        }
        // stage('Build Docker Image'){
        //     steps{
        //         script {
        //             sh '/usr/local/bin/docker build -t testapp-image .'
        //         }
        //     }
        // }

        // stage('Run Docker Container'){
        //     steps{
        //         script {
        //             sh '/usr/local/bin/docker run -p 8090:80 testapp-image .'
        //         }
        //     }
        // }
    }
}