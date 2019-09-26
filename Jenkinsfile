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
    stage ('build image') {
      steps {
        sh "docker-compose build --no-cache"
      }
    }
  }
}
