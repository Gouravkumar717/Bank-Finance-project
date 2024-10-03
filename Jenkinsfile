pipeline {
    agent any
    tools {
        maven "M2_HOME" // Ensure this matches the name configured in Jenkins for Maven
    }
    stages {
        stage ("Clone and Build") {
            steps {
                // Cloning the repository
                git branch: "master", url: "https://github.com/Gouravkumar717/Bank-Finance-project.git", credentialsId: "git-cread"
                
                // Running Maven build
                sh "mvn -Dmaven.test.failure.ignore=true clean package"
            }
        }
    }
}
