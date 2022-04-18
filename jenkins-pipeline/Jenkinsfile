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
                dir("jenkins-pipeline") {
                sh 'pwd'
                sh 'ls -ltr'
                sh 'terraform init'
                }
            }        
        }

        stage('terraform plan and apply') {
            
            steps {
                dir("jenkins-pipeline") {
                sh 'terraform plan'
                sh 'terraform apply --auto-approve'
                }
            }

        }
    }
}
