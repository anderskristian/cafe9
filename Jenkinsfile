pipeline {
  agent {
    docker {
      image 'maven:3.3.3'
    }
    
  }
  stages {
    stage('build') {
      steps {
        echo 'Hej med dig'
      }
    }
    stage('Where are we') {
      steps {
        sh 'pwd'
      }
    }
    stage('maven') {
      steps {
        sh 'mvn --version'
      }
    }
  }
}