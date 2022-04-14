pipeline {
    agent any
    tools {
  terraform 'Terraform-Installer'
}

    environment { 
                AN_ACCESS_KEY = credentials('an_access_key_id') 
}

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
            steps {
                dir("aws_modules") {
                sh 'terraform plan'
                }
            }

        }
    }
}
