// Jenkins File for Pipeline Project.
pipeline{
    agent any
    tools{
        jdk 'JDK21'
    }
    environment{
        DOCKER_IMAGE='jenkins-demo'
        DOCKER_CONTAINER='jenkins-demo-container'
    }
    parameters{
        choice(name: 'Environment',choices:['Testing','Production'],description:'Param Environment')
    }
    stages{
        // stage('git clone step'){
        //     steps{
        //         git branch: 'main', credentialsId: 'rocky_10_github_Personal_Access_Token', url: 'https://github.com/sureshsoudararajan/jenkins-demo.git'
        //     }
        // }
        stage('Build'){
            agent {
                label 'docker-agent'
            }
            steps{
                sh 'chmod +x mvnw'
                sh './mvnw clean package'
            }
        }
        stage('Docker Build'){
            steps{
                sh 'docker build -t $DOCKER_IMAGE:$BUILD_NUMBER .'
            }
        }
        stage('Docker Deploy'){
            steps{
                sh '''
                docker stop $DOCKER_CONTAINER || true
                docker rm $DOCKER_CONTAINER || true
                docker run -d -p 8081:8081 --name $DOCKER_CONTAINER $DOCKER_IMAGE
                '''
            }
        }
        stage('Environment Tesing how its works?'){
            when{
                expression{
                    params.Environment =='Testing'
                }
            }
            steps{
                sh 'ls'
            }
        }
    }
}
