pipeline {
    agent any
    stages {
        stage('Build Rest-API') {
                    steps {
                        sh 'cd spring-petclinic-rest-master/spring-petclinic-rest-master && nohup mvn spring-boot:run &'
                    }
                }

        stage('Build Angular-Front End') {
            steps {
                sh 'cd spring-petclinic-angular/static-content && curl https://jcenter.bintray.com/com/athaydes/rawhttp/rawhttp-cli/1.0/rawhttp-cli-1.0-all.jar -o rawhttp.jar && nohup java -jar ./rawhttp.jar serve . -p 4200 &'
                sh 'sleep 11'

            }
        }
         
        stage('Postman') {
            steps {
                sh 'newman run PostmanFiles/Spring_PetClinic.postman_collection.json -e PostmanFiles/PetClinic_Environment.postman_environment.json -- reporters junit'
            }

        }

        stage('Robot') {
            steps {
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
node {

  notifyStarted()

  /* ... existing build steps ... */
}

def notifyStarted() {
  // send to Slack
  slackSend (color: '#FFFF00', message: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")

  // send to HipChat
  hipchatSend (color: 'YELLOW', notify: true,
      message: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})"
    )

  // send to email
  emailext (
      subject: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
      body: """<p>STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
        <p>Check console output at &QUOT;<a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>&QUOT;</p>""",
      recipientProviders: [[$class: 'DevelopersRecipientProvider']]
    )
}   
}


