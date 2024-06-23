pipeline {
    agent any
    stages{
        stage('Clone Repository'){
            steps{
                git url: 'https://github.com/ChakraHs/angular_jenkins_docker'
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