pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = 'docker-hub-credentials'  // ID of the Docker Hub credentials in Jenkins
        IMAGE_NAME = 'maheshreddy580'  // Docker Hub repository
        TAG = 'latest'  // You can set a dynamic tag if needed (e.g., build number or git hash)
    }

    stages {
        stage('Checkout') {
            steps {
                // Pull the code from your Git repository
                git 'https://github.com/maheshreddy-lag/devops-mahi.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image using the Dockerfile in the repository
                    sh 'docker build -t ${IMAGE_NAME}:${TAG} .'
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    // Login to Docker Hub using Jenkins credentials
                    withCredentials([usernamePassword(credentialsId: DOCKER_HUB_CREDENTIALS, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Push the Docker image to Docker Hub
                    sh 'docker push ${IMAGE_NAME}:${TAG}'
                }
            }
        }
    }

    post {
        success {
            echo 'Docker image was successfully built and pushed to Docker Hub!'
        }
        failure {
            echo 'The pipeline failed. Please check the logs for details.'
        }
    }
}
