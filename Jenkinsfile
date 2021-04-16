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
        sh 'git clone https://github.com/spring-petclinic/spring-petclinic-rest.git'
        sh 'cd spring-petclinic-rest-master/spring-petclinic-rest-master'
        sh 'mvn spring-boot:run'
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




