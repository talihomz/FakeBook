pipeline {
    agent { any }
    stages {
        stage('Tests') {
            steps {
                sh 'docker-compose up -f docker-compose-build.yml'
            }
        }
    }
}
