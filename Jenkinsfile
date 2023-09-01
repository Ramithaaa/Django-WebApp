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
                        dockerImage.push('$BUILD_NUMBER')
                    }

                }
            }
        }

    }
}