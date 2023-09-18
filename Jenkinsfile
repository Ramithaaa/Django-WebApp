def COLORMAP = [
    'SUCCESS': 'good',
    'FAILURE': 'danger'
]


pipeline {
    agent any
    environment {
        registry='huarami/uploader'
        registryCredential='dockerhub'
    }


    #Containarization
    stages {
        stage ('Build Image') {
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
                sh "helm install uploader helm/appcharts"
            }
        }
    }
}
   
