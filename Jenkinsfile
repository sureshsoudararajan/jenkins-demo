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
                echo "Stopping old application if running..."
                pkill -f ${APP_NAME} || true
                sleep 3

                echo "Starting new application..."
                nohup java -jar target/jenkins-demo-0.0.1-SNAPSHOT.jar \
                --server.port=${APP_PORT} \
                --server.address=0.0.0.0 \
                > app.log 2>&1 &

                sleep 5

                echo "Checking if app started..."
                ss -tulnp | grep ${APP_PORT} || true
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