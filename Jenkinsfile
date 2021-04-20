pipeline {
    agent any
    stages {

        stage('Build Rest-API') {
            steps {
                sh '''
                cd spring-petclinic-rest-master/spring-petclinic-rest-master
                mvn spring-boot:run
                '''
            }
        }
        void BuildWithFlag(String flag) {
            skipCondition = false
            catchError(buildResult: 'SUCCESS', stageResult: 'NOT_BUILT') {
                    error "Skipping..." // Force an error so we can set the stageResult
                }
                return
        }

        stage('Build Angular-Front End') {
              steps {
                keepRunning {
                    sh 'cd spring-petclinic-angular/static-content -- curl https://jcenter.bintray.com/com/athaydes/rawhttp/rawhttp-cli/1.0/rawhttp-cli-1.0-all.jar -o rawhttp.jar -- java -jar ./rawhttp.jar serve . -p 4200'
                }

              }
        }
        stage('Test') {
            steps {
                sh "mvn test"
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
        
                stage('Robot') {
            steps {
                sh '''
                cd spring-petclinic-angular/static-content
                curl https://jcenter.bintray.com/com/athaydes/rawhttp/rawhttp-cli/1.0/rawhttp-cli-1.0-all.jar -o rawhttp.jar
                java -jar ./rawhttp.jar serve . -p 4200
                robot --variable BROWSER:headlesschrome -d spring-petclinic-angular/Robotframework/Tests/Results spring-petclinic-angular/Robotframework/Tests
                '''
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
        

        stage('Postman') {
            steps {
              sh 'newman run Spring_PetClinic_Copy.postman_collection.json -- environment PetClinic_Environment.postman_environment.json -- reporters junit'
            }
            post {
                always {
                    junit '**/TEST*.xml'
                }
            }

        }

    }
}



