pipeline {
    agent { dockerfile true }
    stages {
        stage('Test Models') {
            steps {
                sh 'rspec -f d spec/models'
            }
        }
        stage('Test Features') {
            steps {
                sh 'rspec -f d spec/features'
            }
        }
    }
}
