pipeline {
    agent any
    stages {
        stage('Tests') {
            steps {
                sh 'docker-compose -f docker-compose-build.yml build'
                sh 'docker-compose run --rm web rails db:create'
                sh 'docker-compose run --rm web rails db:migrate'
                sh 'docker-compose run --rm web rspec -f d'
            }
        }
    }
}
