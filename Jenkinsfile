pipeline {
    agent any

    environment {
        APP_NAME = "jenkins-demo"
        APP_PORT = "8081"
    }

    stages {

        stage('Build') {
            steps {
                sh '''
                chmod +x mvnw
                ./mvnw clean package
                '''
            }
        }

        stage('Deploy') {
    steps {
        sh '''
        echo "Copying jar to /opt directory"
        sudo cp target/jenkins-demo-0.0.1-SNAPSHOT.jar /opt/jenkins-demo/jenkins-demo.jar

        echo "Restarting systemd service"
        sudo systemctl restart jenkins-demo

        sleep 5

        sudo systemctl status jenkins-demo --no-pager
        '''
    }
}
    }

    post {
        success {
            echo "Application deployed successfully on port ${APP_PORT}"
        }
        failure {
            echo "Build or deployment failed"
        }
    }
}