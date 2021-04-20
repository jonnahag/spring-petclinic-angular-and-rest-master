pipeline {
  agent any 
  stages {
    
    stage('Build Rest-API') {
      steps {
         sh 'cd spring-petclinic-rest-master/spring-petclinic-rest-master -- mvn spring-boot:run'
            }      
    }
    
    stage('Build Angular-Front End') {
      steps {
        sh 'cd spring-petclinic-angular/static-content -- curl https://jcenter.bintray.com/com/athaydes/rawhttp/rawhttp-cli/1.0/rawhttp-cli-1.0-all.jar -o rawhttp.jar -- java -jar ./rawhttp.jar serve . -p 4200'
      }
    }
        
    stage('Test') {
               steps {
                sh 'npm install'
                sh 'npm run newman-tests'
                junit 'newman.xml'
            }
        
      steps {
        sh 'mvn test'
      }
     post {
      always {
        junit '**/TEST*.xml'
          step(
                         [
                                  $class           : 'JacocoPublisher',
                                  execPattern      : 'build/jacoco/jacoco.exec',
                                  classPattern     : 'build/classes/main',
                                  sourcePattern    : 'src/main/java',
                                  exclusionPattern : '**/*Test.class'
                         ]
                     )
      }
    }
  }
      stage('newman') {
        steps {
           sh 'cd spring-petclinic-rest-master/spring-petclinic-rest-master -- mvn spring-boot:run -- newman run Spring_PetClinic_Copy.postman_collection.json -e PetClinic_Environment.postman_environment.json -r junit, html--reporter-junit-export var/reports/newman/junit/newman.xml --reporter-html-export var/reports/newman/html/index.html'
          
           publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'var/reports/newman/html', reportFiles: 'index.html', reportName: 'Newman API Test', reportTitles: ''])
        } 
             }
      post {
        always {
          junit '**/TEST*.xml'
            }
          }
       }
 }
}
