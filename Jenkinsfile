pipeline {
	agent { dockerfile true }
	stages {
		stage('test'){
			steps {
				sh './test.sh'
			}
		}
		stage('deploy') {
			steps {
				sh 'curl -H "x-terminate: true" https://python.ec2.ashwink.com.np'
			}
		}
	}
}
