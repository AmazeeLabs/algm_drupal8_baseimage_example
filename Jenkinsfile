pipeline {
  agent any
  environment {
    JWTSSHPort = 32222
    JWTSSHHost = 'ssh.lagoon.amazeeio.cloud'
    GRAPHQLEndpoint = 'https://api.lagoon.amazeeio.cloud/graphql'
    JWTTOKEN = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIxNCwiaXNzIjoiYXV0aC5hbWF6ZWUuaW8iLCJyb2xlIjoibm9uZSIsImF1ZCI6ImFwaS5kZXYiLCJpYXQiOjE1Njk0OTMxMjl9.l4BKbqFD6YuEWHCjVVSp31su-CDuCsclL4iOUitda20'
    QUERY = '{"query": "mutation { deployEnvironmentLatest(input: { environment: { name: \\"master\\" project: { name: \\"umami-demo\\" } } }) }"}'
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
    stage('Lagoon Deployment') {
      steps {
        // sh "ssh -p 32222 -o LogLevel=ERROR -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -t lagoon@ssh.lagoon.amazeeio.cloud token 2>&1"
        sh """
          echo ${QUERY} | curl \
            -X POST \
            ${GRAPHQLEndpoint} \
            -H 'Content-Type: application/json' \
            -H "Authorization: Bearer ${JWTTOKEN}" \
            -d @-
        """
      }
    }
  }
}
