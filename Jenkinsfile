pipeline {
    agent { dockerfile true }
    stages {
        stage('Test Models') {
            steps {
                sh 'rspec -f d models'
            }
        }
        stage('Test Features') {
            steps {
                sh 'rspec -f d features'
            }
        }
    }
}
