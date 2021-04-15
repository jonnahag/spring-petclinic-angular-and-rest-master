pipeline {
  agent any 
  stages {
    stage('Build') {
      steps {
        sh "mvn compile"
      }
    }  
    stage('Test') {
      steps {
        sh "mvn test"
      }
     post {
      always {
        junit 'target/surefire-reports/TEST*.xml'

      }
     }
  }
    stage('newman') {
      steps {
        sh 'newman run postmanLab/collection.json --environment postmanLab/environment.json --reporters junit'
      }
      post {
        always {
          junit 'newman/*xml'
        }
      }
    }
    stage('Robot Framework System tests with Selenium') {
      steps {
        sh 'robot --variable BROWSER:headlesschrome -d Results infotivTest1/infotivTest/Test'
      }
      post {
        always {
          script {
            step(
              [
                $class              : 'RobotPublisher',
                outputPath          : 'Results',
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




