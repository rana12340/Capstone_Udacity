pipeline {
	agent any
	stages {
		stage('Build') {
			steps {
				sh 'echo Building...'
			}
		}
		stage('Lint HTML') {
			steps {
				sh 'tidy -q -e *.html'
			}
		}
		stage('Build Docker Image') {
			steps {
				sh 'echo Building...'
				//sh 'docker build -t capstone-project-cloud-devops .'
			}
		}
		stage('Push Docker Image') {
			steps {
				sh 'echo Building...'
				//withDockerRegistry([url: "", credentialsId: "DockerHub_Kuldeep"]) {
				//    sh "docker tag capstone-project-cloud-devops kuldeeprana/udacapstone"
				//    sh 'docker push kuldeeprana/udacapstone'                 }
			}
		}
		stage('Deploying') {
			steps{
				echo 'Deploying to AWS...'
				}
			}
		stage("Cleaning up") {
			steps{
				echo 'Cleaning up...'
				//  sh "docker system prune"
			}
		}
	}
	
}
