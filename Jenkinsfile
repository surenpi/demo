pipeline {
    agent {
        label "master"
    }
    stages {
      stage('one') {
          steps{
            echo "one"
            echo "jira"
            echo "jira again"
          }
      }
        
      stage('two') {
          steps{
            echo "two"
              
              script {
                def uploadSpec = """{
                  "files": [
                    {
                      "pattern": "Jenkinsfile",
                      "target": "test"
                    }
                 ]
                }"""
                server.upload(uploadSpec)
              }
          }
      }
    }
  }
