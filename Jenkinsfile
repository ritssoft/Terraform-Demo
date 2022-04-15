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
node {
withCredentials([file(credentialsId: 'rsa_id', variable: 'rsa')]) {
   sh "echo $rsa"
   sh "cp \$rsa /src/main/resources/rsa_id.pub"   
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

}