# Jekins

> 推荐使用了流水线(`pipeline`)模式,自由风格是为老版本的`jenkins`做兼容而保留的.  
> `pipeline`又区分声明式(`Declarative Pipeline`)和脚本化(`Scripted Pipeline`).  
> 声明式更简单但是限制多,脚本化复杂但是更灵活  
> 脚本化`Pipeline`为`Groovy`语言为基础的. 大多数`Groovy`语法都可使用.

## 示例

```Groovy
//Jenkinsfile (Declarative Pipeline)
pipeline {
    agent any
    stages {
        stage('Stage 1') {
            steps {
                echo 'Hello world!'
            }
        }
    }
}
//Jenkinsfile (Scripted Pipeline)
node {
    stage('Stage 1') {
        echo 'Hello World'
    }
}
```

```Groovy
//Jenkinsfile (Declarative Pipeline)
pipeline {
    agent any
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('Build') {
            steps {
                sh 'make'
            }
        }
        stage('Test'){
            steps {
                sh 'make check'
                junit 'reports/**/*.xml'
            }
        }
        stage('Deploy') {
            steps {
                sh 'make publish'
            }
        }
    }
}
//Jenkinsfile (Scripted Pipeline)
node {
    stage('Build') {
        sh 'make'
    }
    stage('Test') {
        sh 'make check'
        junit 'reports/**/*.xml'
    }
    if (currentBuild.currentResult == 'SUCCESS') {
        stage('Deploy') {
            sh 'make publish'
        }
    }
}
```

## 资料

- Jenkins 文档 <https://jenkins.io/doc/>
- Jenkins Pipeline 文档 <https://jenkins.io/doc/book/pipeline/>
