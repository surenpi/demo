def isEmpty(str){
    return str == "" || str == null
}

pipeline {
    agent any

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
                                echo "title, description, author or poster can not be empty"
                                //githubPRComment comment: githubPRMessage('文件格式错误 ${BUILD_NUMBER} ${BUILD_STATUS}')
                                currentBuild.result = "FAILURE"
                            }

                            if(!isEmpty(article.translator) && isEmpty(article.original)) {
                                echo "current article is translated from the origin one, please provide the original link"
                                currentBuild.result = "FAILURE"
                                //githubPRComment comment: githubPRMessage('缺少原文链接 ${BUILD_NUMBER} ${BUILD_STATUS}')
                            }
                        }
                    }
                }
            }
        }
    }
}
