pipeline {
 agent any
 environment {
   JWTSSHPort = 32222,
   JWTSSHHost = 'ssh.lagoon.amazeeio.cloud',
   GRAPHQLEndpoint = 'https://api.lagoon.amazeeio.cloud/graphql'
 }
 options {
   buildDiscarder(logRotator(numToKeepStr: '10'))
 }
 triggers {
   // This tells Jenkins to poll for changes in git instead of
   // waiting for webhooks.
   pollSCM('* * * * *')
 }

 stages {
   stage ('build image') {
      try {
        sh "docker-compose build --no-cache"
      } catch (e) {
        error(e, 'build image')
      }
    }
  }
}
