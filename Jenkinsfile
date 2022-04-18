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
        withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding', 
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID', 
                    credentialsId: 'AWS-CREDS', 
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                    ]]
                )
        {       
        stage('terraform init') {
                    dir("jenkins-pipeline") {
                    sh 'pwd'
                    sh 'ls -ltr'
                    sh 'terraform init'
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
}
