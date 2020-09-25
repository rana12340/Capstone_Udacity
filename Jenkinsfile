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
				sh 'docker build -t udacapstone .'
			}
		}
		stage('Push Docker Image') {
			steps {
				sh 'echo Building...'
				withDockerRegistry([url: "", credentialsId: "DockerHub_Kuldeep"]) {
			    sh "docker tag udacapstone kuldeeprana/udacapstone"
			    sh 'docker push kuldeeprana/udacapstone'                 }
			}
		}
		stage('Deploying') {
			steps{
				echo 'Deploying to AWS...'
                  withAWS(credentials: 'uda_aws', region: 'us-east-1') {
                      sh "aws eks --region us-west-2 update-kubeconfig --name ranaudacap"
                      sh "kubectl config use-context arn:aws:eks:us-west-2:988212813982:cluster/ranaudacap"
                      sh "kubectl set image deployments/udacapstone udacapstone=kuldeeprana/udacapstone:latest"
                      sh "kubectl apply -f deployment.yml"
                      sh "kubectl get nodes"
                      sh "kubectl get deployment"
                      sh "kubectl get pod -o wide"
                      sh "kubectl get service/udacapstone"
				}
			}
		stage("Cleaning up") {
			steps{
				echo 'Cleaning up...'
				sh "docker system prune"
			}
		}
	}
	
}
