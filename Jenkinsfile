pipeline {
  agent any
  environment {
    JWTSSHPort = 32222
    JWTSSHHost = 'ssh.lagoon.amazeeio.cloud'
    GRAPHQLEndpoint = 'https://api.lagoon.amazeeio.cloud/graphql'
  }

  options {
    buildDiscarder(logRotator(numToKeepStr: '10'))
  }

  stages {
    stage ('Build Info') {
      sh 'env | sort'
    }
    stage ('Build image') {
      steps {
        sh "docker-compose build --no-cache"
      }
    }
    stage('Test') {
      steps {
        echo 'Testing'
      }
    }
    stage('Deploy') {
      steps {
        echo 'Deploying'
      }
    }
  }
}
