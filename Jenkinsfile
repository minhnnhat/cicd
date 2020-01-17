pipeline {
    agent { label 'master'}
    environment {
        registry = "docker-registry.ranchers.xyz/test-deploy"
        registryCredential = 'docker-registry'
        dockerImage = ''
    }
    stages{
        stage("Git clone"){
            steps {
                git 'https://github.com/kemallaydin/Configuring-CI-CD-on-Kubernetes-with-Jenkins.git'
            }
        }
        stage('Building image') {
            steps{
               script {
                  dockerImage = docker.build registry + ":$BUILD_NUMBER"
               }
            }
        }
        stage('Deploy Image') {
            steps{
               script {
                  docker.withRegistry( '', registryCredential ) {
                  dockerImage.push()
                  }
               }
            }
        }
    }
}