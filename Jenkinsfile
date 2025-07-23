pipeline {
	agent { docker { image 'tiangolo/uwsgi-nginx-flask:python3.12' } }
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
