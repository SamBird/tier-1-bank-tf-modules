pipeline {
  agent {
    kubernetes {
      yaml """
      apiVersion: v1
      kind: Pod
      metadata:
        labels:
          jenkins: terraform
      spec:
        containers:
        - name: terraform
          image: hashicorp/terraform
          command:
          - cat
          tty: true
      """
    }
  }
  
  stages {
    
    stage('Terraform Init') {
      steps {
        container('terraform') {
          script {
            def directories = sh(returnStdout: true, script: 'ls -d gcp*/').trim().split('\n')
            for (def directory in directories) {
              directory = directory.replace('/', '') // Remove trailing slash
              echo "Running Terraform init in directory: $directory"
              dir(directory) {
                sh 'terraform init'
              }
            }
          }
        }
      }
    }

  }
}
