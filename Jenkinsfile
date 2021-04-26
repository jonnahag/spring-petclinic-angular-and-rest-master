pipeline {
    agent any
    stages {
        stage('Build Rest-API') {
                    steps {
                        bat 'cd spring-petclinic-rest-master/spring-petclinic-rest-master && mvn spring-boot:run &'
                        
                    }
                }

                stage('Build Angular-Front End') {
                      steps {
                        bat 'cd spring-petclinic-angular/static-content && curl https://jcenter.bintray.com/com/athaydes/rawhttp/rawhttp-cli/1.0/rawhttp-cli-1.0-all.jar -o rawhttp.jar && nohup java -jar ./rawhttp.jar serve . -p 4200 &'
                      }
                }
        
        stage('Test') {
            steps {
                bat "mvn test"
            }
            post {
                always {
                    junit '**/TEST*.xml'
                }
            }

        }

                stage('Robot') {
            steps {
                bat 'robot --variable BROWSER:headlesschrome -d spring-petclinic-angular/Results spring-petclinic-angular/Tests'
            }
            post {
                always {
                    script {
                        step(
                            [
                                $class                  :   'RobotPublisher',
                                outputPath              :   'spring-petclinic-angular/Tests/Results',
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
        
        
       stage('DelayPostmanTest') {
           steps {
               bat 'sleep 5'
          }
        }
        

        stage('Postman') {
            steps {
              bat 'newman run PetClinic_Project.postman_collection.json -e PetClinic_Environment.postman_environment.json -- reporters junit'
            }
                post {
                always {
                    junit '**/TEST*.xml'
                }
            
                }
        }

    }
}
        
