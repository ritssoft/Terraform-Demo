pipeline {
    agent any
    tools {
  terraform 'Terraform-Installer'
}

    stages {

        stage('git checkout') {
            steps {
                git branch: 'feature/aws-modules', credentialsId: 'f2347391-0b00-418a-875a-e1112e9162e4', url: 'https://github.com/ritssoft/Terraform-Demo.git'
            }

        stage('terraform init') {
            steps {
                sh 'terraform init'
            }
        
        stage('terraform plan') {
            steps {
                sh 'terraform plan'
            }        
        }
    }
}
