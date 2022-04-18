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
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding', 
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID', 
                    credentialsId: 'AWS-CREDS', 
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                    ]]
                )

                {                 
                    dir("jenkins-pipeline") {
                    sh 'pwd'
                    sh 'ls -ltr'
                    sh 'echo Access key is ${AWS_ACCESS_KEY_ID}'
                    sh 'echo Access key is ${AWS_SECRET_ACCESS_KEY}'
                    sh 'terraform init'
                    sh 'terraform plan'
                    sh 'terraform apply --auto-approve'
                    }
                }
            }        
        }

    }
}
