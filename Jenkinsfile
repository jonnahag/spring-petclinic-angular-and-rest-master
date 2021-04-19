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
        sh 'mvn test'
      }
     post {
      always {
        junit '**/TEST*.xml'
      }
    }
  }
      stage('newman') {
        steps {
           sh 'cd spring-petclinic-rest-master/spring-petclinic-rest-master -- mvn spring-boot:run -- newman run Spring_PetClinic_Copy.postman_collection.json --environment PetClinic_Environment.postman_environment.json --reporters junit'
      }
      post {
        always {
          junit '**/TEST*.xml'
            }
          }
        }
    
      stage('Robot Framework System tests with Selenium') {
         steps {
            sh 'robot --variable BROWSER:headlesschrome -d xxx/Results xxx/Tests'
        }
        post {
          always {
              script {
                    step(
                                [
                                  $class              : 'RobotPublisher',
                                  outputPath          : 'xxx/Results',
                                  outputFileName      : '**/output.xml',
                                  reportFileName      : '**/report.html',
                                  logFileName         : '**/log.html',
                                  disableArchiveOutput : false,
                                  passThreshold       : 50,
                                  unstableThreshold   : 40,
                                  otherFiles          : "**/*.png,**/*.jpg",
                                ]
                         )
                }
             }
          }
       }
    
 }
}




