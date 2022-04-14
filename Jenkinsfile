pipeline {
    agent any
    tools {
  terraform 'Terraform-Installer'
}
/*
    environment { 
                ID_RSA = credentials('id_rsa') 
}
*/
    stages {
               
        stage('terraform init') {
            steps {
                dir("aws_modules") {
                sh 'pwd'
                sh 'ls -ltr'
                sh 'terraform init'
                }
            }        
        }

        stage('terraform plan') {

            environment { 
                ID_RSA = credentials('id_rsa') 
            }

            steps {
                dir("aws_modules") {
                sh 'terraform plan'
                }
            }

        }
    }
}
