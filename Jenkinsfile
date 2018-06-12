pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'docker-compose build'
      }
    }
    stage('Deploy') {
      steps {
        sh 'git push heroku feature/posts:master'
        sh 'git checkout feature/posts'
      }
    }
  }
}