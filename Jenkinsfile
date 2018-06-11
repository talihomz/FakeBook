pipeline {
    agent { label 'Mjengo' }
    stages {
        stage('Tests') {
            steps {
                sh 'docker-compose up -f docker-compose-build.yml'
            }
        }
    }
}
