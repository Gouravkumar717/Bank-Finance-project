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
    }
}
