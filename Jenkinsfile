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
            
            steps {
                script {
                    withCredentials([file(credentialsId: 'RSA_ID', variable: 'rsa')]) {                    
                        dir("aws_modules") {
                        sh "echo $rsa"
                        sh "cp \$rsa /src/main/resources/rsa_id.pub"
                        sh 'terraform plan'
                        }
                    }
                }
            }

        }
    }
}
