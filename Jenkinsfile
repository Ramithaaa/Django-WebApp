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
                sh "kubectl delete namespace app"
                sh "kubectl create namespace app"
                sh "helm install uploader helm/appcharts --namespace app"
            }
        }
    }

    post {
        always {
            slackSend channel: '#webapp',
                      color: COLORMAP[currentBuild.currentResult],
                      message: "Web app build job:${Build_Number} is a ${currentBuild.currentResult}"
        }
    }
}
   
