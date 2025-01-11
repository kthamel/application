pipeline {
    agent any

    environment {
        S3_BUCKET = 'kthamel-infrastructure-application'
        FUNCTION_NAME = 'application-01'
    }

    stages {
        stage('Terraform Init') {
            steps {
                sh '''
                cd terraform
                terraform init
                '''
            }
        }

        stage('Terraform Validate') {
            steps {
                sh '''
                cd terraform
                terraform fmt .
                terraform validate
                '''
            }
        }

        stage('Terrform Plan') {
            steps {
                sh '''
                cd terraform
                terraform plan
                '''
            }
        }

        stage('Terrform Apply') {
            steps {
                sh '''
                cd terraform
                terraform apply --auto-approve
                '''
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished!'
        }
    }
}
