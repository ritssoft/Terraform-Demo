pipeline {
    agent any
    tools {
  terraform 'Terraform-Installer'
}

    stages {
               
        stage('terraform init') {
            steps {
                dir("aws-modules") {
                sh 'pwd'
                sh 'ls -ltr'
                sh 'terraform init'
                }
            }        
        }

        stage('terraform plan') {
            steps {
                dir("aws-modules") {
                sh 'terraform plan'
                }
            }

        }
    }
}
