pipeline {
  agent any
  environment {
    JWTSSHPort = 32222
    JWTSSHHost = 'ssh.lagoon.amazeeio.cloud'
    GRAPHQLEndpoint = 'https://api.lagoon.amazeeio.cloud/graphql'
    QUERY = '{ "query": "mutation { deployEnvironmentLatest(input: { environment: { name: \\"master\\" project: { name: \\"umami-demo\\" } } }) }" }'
  }

  options {
    buildDiscarder(logRotator(numToKeepStr: '10'))
  }

  stages {
    stage ('Build Info') {
      steps {
        sh 'env | sort'
      }
    }
    stage ('Build image') {
      steps {
        echo "Building image..."
        // sh "docker-compose build --no-cache"
      }
    }
    stage('Test') {
      steps {
        echo 'Testing'
      }
    }
    stage ('Lagoon deployment') {
      steps {
        withCredentials([string(credentialsId: 'JWTTOKEN', variable: 'JWTTOKEN')]) {
          sh """
            curl \
              -X POST \
              -H "Content-Type:application/json" \
              -H "Authorization: Bearer ${JWTTOKEN}" \
              -d ${env.QUERY} \
              ${env.GRAPHQLEndpoint}
          """
        }
      }
    }
  }
}
