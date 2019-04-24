def isEmpty(str){
    return str == "" || str == null
}

pipeline {
    agent any
    
    triggers {
      githubPullRequests events: [commitChanged()], spec: '', triggerMode: 'CRON'
    }

    stages{
        stage("validation"){
            steps{
                script{
                    withChangeSets(){
                        if(env.changePath != "" && env.changePath != null && env.changePath.endsWith(".md")) {
                            def articles = readYaml file: env.changePath
                            def article = articles[0]
                            if(isEmpty(article.title) || isEmpty(article.description)
                                || isEmpty(article.author) || isEmpty(article.poster)){
                                githubPRComment comment: githubPRMessage('文件格式错误 ${BUILD_NUMBER} ${BUILD_STATUS}')
                                currentBuild.result = "FAILURE"
                            }

                            if(!isEmpty(article.translator) && isEmpty(article.original)) {
                                githubPRComment comment: githubPRMessage('缺少原文链接 ${BUILD_NUMBER} ${BUILD_STATUS}')
                            }
                        }
                    }
                }
            }
        }
    }
}
