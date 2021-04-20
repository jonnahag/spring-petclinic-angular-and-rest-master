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
 /*       
 stage('Test') {
      steps {
        sh "mvn test"
      }
     post {
      always {
         junit '**/TEST*.xml'
      }
     }
  }
*/

   stage('newman') {
        steps {
           sh ' newman run Spring_PetClinic.postman_collection.json --environment PetClinic_Environment.postman_environment.json --reporters junit '
              }
            post {
                  always {
                          junit '**/TEST*.xml'
                         }
                  }
        }
  stage("My stage") {            
        steps {
            bat label: 'My batch script',
                script: ''' @echo off
                            return_1_if_success.exe   // command which returns 1 in case of success, 0 otherwise
                            IF %ERRORLEVEL% EQU 1 (exit /B 0) ELSE (exit /B 1)'''
        }
    }
}
 
}
}
