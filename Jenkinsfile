pipeline {
    agent any
    tools {
  terraform 'Terraform-Installer'
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
                sh "terraform plan -out=tfplan -input=false -var-file='terraform.tfvars'"
                }
            }

        }
    }
}
