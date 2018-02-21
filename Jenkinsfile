pipeline {
  agent any
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
        mail(subject: 'Mail fra Jenkins', body: 'Der bygges', to: 'aka@myself.com')
      }
    }
  }
}