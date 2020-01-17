pipeline {
    agent { label 'master'}
    environment {
        
    }
    stages{
        stage("Git clone"){
            steps {
                git 'https://github.com/kemallaydin/Configuring-CI-CD-on-Kubernetes-with-Jenkins.git'
            }
        }
        stage("Build image"){
            steps {
            sh 'docker build -t test/deploy:dev .'
            sh 'docker images | grep dev'
            }
        }
    }
}