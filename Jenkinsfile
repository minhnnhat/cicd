pipeline {
    agent { label 'master'}
    environment {
        registry = "docker-registry.ranchers.xyz/minh-test-deploy"
        registryCredential = 'docker-registry'
        dockerImage = ''
    }
    stages{
        stage("Git clone"){
            steps {
                git 'https://github.com/minhnnhat/cicd.git'
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
                  withDockerRegistry(credentialsId: 'docker-registry', url: 'http://docker-registry.ranchers.xyz/') {
                  dockerImage.push()
                  }
               }
            }
        }
        stage('Remove unused docker image') {
            steps{
               sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
        stage('Deploy on k8s') {
            steps{
                withKubeConfig([credentialsId: 'kubeconfig']) {
                sh 'cat deployment.yaml'
                sh 'sed -i "s/BUILD_NUMBER/$BUILD_NUMBER/g" deployment.yaml'
                // sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl apply -f service.yaml & kubectl apply -f deployment.yaml'
                }
            }
        }
    }
}

