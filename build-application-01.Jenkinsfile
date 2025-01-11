pipeline {
    agent any

    environment {
        S3_BUCKET = 'kthamel-infrastructure-application'
        FUNCTION_NAME = 'application-01'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/kthamel/application.git', branch: 'main'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                rm -rf build
                mkdir build
                '''
            }
        }

        stage('Package Lambda Function') {
            steps {
                sh '''
                cp application-01.py ./build/
                cd build
                zip -r ../application-01.zip .
                '''
            }
        }

        stage('Upload to S3') {
            steps {
                sh '''
                aws s3 cp application-01.zip s3://${S3_BUCKET}/application-01.zip
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
