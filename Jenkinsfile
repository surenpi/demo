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
        
        
      stage('maven') {
          tools {
              maven 'maven'
          }
          steps{
              script {
                  sh 'mvn clean install -DskipTests'
              }
          }
      }
        
        
        
      stage('three') {
          steps{
              script {
                  def server = Artifactory.server 'artifactory'
                  def rtMaven = Artifactory.newMavenBuild()
                  rtMaven.tool = 'maven'
                  
                  def buildInfo = rtMaven.run pom: 'pom.xml', goals: 'clean install -DskipTests'
              }
          }
      }
    }
  }
