pipeline {
    agent any
    stages {
        stage('Tests') {
            steps {
                sh 'docker-compose build'
                sh 'docker-compose run --rm web bin/rails db:create'
                sh 'docker-compose run --rm web bin/rails db:migrate'
                sh 'docker-compose run --rm web bin/rspec -f d'
            }
        }
    }
}
