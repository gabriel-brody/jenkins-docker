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
    stage('Build gitbook'){
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
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove container'){
      steps{
        sh "docker rm -f webserver"
      }
    }
    stage('Deloy container') {
      steps{
        sh "docker run -d --name webserver -p 80:80 $registry:latest"
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker image prune -af"
      }
    }
  }
}