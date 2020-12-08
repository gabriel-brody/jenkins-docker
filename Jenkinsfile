pipeline {
  environment {
    registry = "gbrody/docker-test"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git ([url: 'https://github.com/gabriel-brody/jenkins-docker.git', branch: 'main'])
      }
    }
    stage('Building gitbook'){
      steps{
        sh "gitbook build"
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":latest"
        }
      }
    }
    stage('Pushing Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Removing container'){
      steps{
        catchError {
          sh "docker rm -f webserver"
        }
        echo currentBuild.result
      }
    }
    stage('Deloying container') {
      steps{
        sh "docker run -d --name webserver -p 80:80 $registry:latest"
      }
    }
    stage('Removing untagged docker image') {
      steps{
        sh "docker image prune -af"
      }
    }
  }
}