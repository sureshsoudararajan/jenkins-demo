pipeline {
    agent any

    stages {

        stage('Build') {
            steps {
                sh '''
                chmod +x mvnw
                ./mvnw clean package
                '''
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t jenkins-demo .'
            }
        }

        stage('Docker Deploy') {
            steps {
                sh '''
                docker stop jenkins-demo-container || true
                docker rm jenkins-demo-container || true
                docker run -d -p 8081:8081 --name jenkins-demo-container jenkins-demo
                '''
            }
        }
    }
}