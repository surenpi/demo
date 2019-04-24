pipeline {
    agent any
    
    stages{
        stage("one"){
            steps{
                script{
                    def abc = readYaml text: '''
---
title: "社交媒体"
description: "Jenkins 中文社区的社交媒体"
date: 2019-04-12T14:26:05+08:00
draft: false
---

社区所有的技术、活动类的文章都会同步发布到下面的社交媒体平台上。
                    '''
                    
                    print abc
                    echo abc[0].title

checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/surenpi/demo']]])

                    
                    withChangeSets(){
                        echo env.changePath
                        if(env.changePath != "" && env.changePath != null) {
                            def articles = readYaml file: env.changePath
                            def article = articles[0]
                            print article
                            if(article.title == "" || article.description == ""
                                || article.author == ""
                                || article.author == null){
                                    echo "FAILURE"
                                currentBuild.result = "FAILURE"
                                
                                githubPRComment comment: githubPRMessage('文件格式错误 ${BUILD_NUMBER} ${BUILD_STATUS}')
                            }
                        }
                    }
                    // print currentBuild.changeSets[0]
                    // def file = readYaml file: currentBuild.changeSets[0][0].affectedFiles[0].path
                    // print file[0].title
                }
            }
        }
    }
}
