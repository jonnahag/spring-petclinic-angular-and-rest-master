pipeline {
    agent any
     stages {
         stage('parallel') {
             parallel {
        stage('Build Rest-API') {
                    steps {
                        sh 'cd spring-petclinic-rest-master/spring-petclinic-rest-master && nohup mvn spring-boot:run &'
                        sh 'sleep 5' 
                    }
                }

                stage('Build Angular-Front End') {
                      steps {
                        sh 'cd spring-petclinic-angular/static-content && curl https://jcenter.bintray.com/com/athaydes/rawhttp/rawhttp-cli/1.0/rawhttp-cli-1.0-all.jar -o rawhttp.jar && nohup java -jar ./rawhttp.jar serve . -p 4200 &'
                        sh 'sleep 5' 
                      }
                }
        
     

        stage('Postman') {
            steps {
              sleep (30)  
              sh 'newman run Spring_PetClinic.postman_collection.json -e PetClinic_Environment.postman_environment.json -- reporters junit'
            }
                post {
                always {
                    junit '**/TEST*.xml'
                }
            
                }
        }
         stage('Robot') {
            steps {
                sleep (60)
                sh 'robot --variable BROWSER:headlesschrome -d spring-petclinic-angular/Robotframework/Tests/Results spring-petclinic-angular/Robotframework/Tests'
            }
            post {
                always {
                    script {
                        step(
                            [
                                $class                  :   'RobotPublisher',
                                outputPath              :   'spring-petclinic-angular/Robotframework/Tests/Results',
                                outputFileName          :   '**/output.xml',
                                reportFileName          :   '**/report.html',
                                logFileName             :   '**/log.html',
                                disableArchiveOutput    :   false,
                                passThreshold           :   50,
                                unstableThreshold       :   40,
                                otherFiles              :   "**/*.png,**/*.jpg",
                            ]
                        )
                    }
                }
            }
        }

             }
         }
    }
             
}
