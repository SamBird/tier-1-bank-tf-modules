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
    stage('Terraform') {
      steps {
        container('terraform') {
          // Execute Terraform commands within the container
          sh 'terraform init'
          
        }
      }
    }
  }
}
