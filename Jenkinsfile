pipeline {
    agent any
    tools {
        maven "M2_HOME" // Make sure M2_HOME is defined in Jenkins Global Tool Configuration
    }
    stages {
        stage ("Clone and Build") {
            steps {
                // Clone the repository using credentials and specify the correct branch
                git branch: 'main', url: 'https://github.com/Gouravkumar717/Bank-Finance-project.git', credentialsId: 'git-cread'
                
                // Build the project with Maven, ignoring test failures
                sh "mvn -Dmaven.test.failure.ignore=true clean package"
            }
        }
        stage ('Generate Test Reports') {
            steps {
                publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '/var/lib/jenkins/workspace/Banking-Finance-project/target/surefire-reports', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: '', useWrapperFileDirectly: true])
            }
        }
        stage ('Create Docker Images') {
            steps {
                sh "docker build -t gourav787/bank-project:1.0 ."
            }
        }
        stage ("Docker-login") {
            steps {
                withCredentials([usernamePassword(credentialsId: 'Docker-cred', passwordVariable: 'dockerpassword', usernameVariable: 'dockerlogin')]) {
                    sh "docker logi -u ${dockerlogin} -p ${dockerpassword}"
                }
            }
        }
        stage("Docker-push") {
            steps {
                sh "docker push gourav787/bank-project:1.0"
            }
        }
    }
}
