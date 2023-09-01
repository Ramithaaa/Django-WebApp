pipeline {
    agent any
    environment {
        registry='huarami/uploader'
        registryCredential='dockerhub'
    }

    stages {
        stage ('Build') {
            steps {
                script {
                    dockerImage=docker.build registry                
                }
            }
        }
        stage ('Push to DockerHub') {
            steps {
                script {
                    docker.withRegistry("",registryCredential) {
                        dockerImage.push('latest')
                    }

                }
            }
        }
        stage ('Deploy to Kubernetes') {
            agent { label 'KUBE' }
            steps {
                sh "kubectl apply -f ."
            }
        }
    }
}