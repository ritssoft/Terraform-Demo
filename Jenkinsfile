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
                withCredentials([
                    AWSAccessKeyId(credentials: 'AWS-CREDS', accessKeyVariable: 'AWS_ACCESS_KEY_ID'), 
                    AWSSecretKey(credentials: 'AWS-CREDS', secretKeyVariable: 'AWS_ACCESS_KEY_ID' )
                    ]) {

                        sh "Some script ${AWS_ACCESS_KEY_ID} and ${AWS_ACCESS_KEY_ID}"

                }

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
