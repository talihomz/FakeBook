pipeline {
    agent any
    stages {
        stage('Tests') {
            steps {
                sh 'docker-compose -f docker-compose-build.yml up'
            }
        }
    }
}
