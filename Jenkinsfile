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
          script {
            // Execute Terraform commands within the container
            def directories = findFiles(glob: 'gcp*')
                for (directory in directories) {
                if (directory.isDirectory()) {
                    echo 'Directory for TF INIT: ' + directory
                    sh 'terraform init'
                }
                }
          }
        
          
        }
      }
    }
  }
}
