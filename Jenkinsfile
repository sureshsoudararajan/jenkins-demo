pipeline {
    agent any

    stages {

        stage('Build') {
            steps {
                sh 'chmod +x mvnw'
                sh './mvnw clean package'
            }
        }

        stage('Run') {
            steps {
                sh 'nohup java -jar target/jenkins-demo-0.0.1-SNAPSHOT.jar --server.port=8081 &'
            }
        }
    }
}