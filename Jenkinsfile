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
                def server = Artifactory.server 'artifactory'
                def uploadSpec = """{
                  "files": [
                    {
                      "pattern": "Jenkinsfile",
                      "target": "jenkins-test"
                    }
                 ]
                }"""
                server.upload(uploadSpec)
              }
          }
      }
    }
  }
