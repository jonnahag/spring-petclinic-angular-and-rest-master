pipeline {
  agent any 
  stages {
    stage('Build') {
      steps {
        sh 'mvn compile'
      }
    }
    
    stage('Build Rest-API') {
      steps {
        sh 'cd spring-petclinic-rest-master/spring-petclinic-rest-master -- mvn spring-boot:run'
      }
    }
        
    stage('Test') {
      steps {
        sh 'mvn test'
      }
     post {
      always {
        junit '**/TEST*.xml'

      }
     }
  }

  }
}




