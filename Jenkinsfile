pipeline {
  agent any
  
  stages {
    stage('Checkout') {
      steps {
        git 'https://github.com/your-repo-with-terraform-modules.git'
      }
    }
    
    stage('Terraform Init') {
      steps {
        script {
          def tfHome = tool name: 'Terraform', type: 'org.jenkinsci.plugins.terraform.TerraformInstallation'
          def tf = "${tfHome}/bin/terraform"
          sh "${tf} init"
        }
      }
    }
    
    // stage('Terraform Plan') {
    //   steps {
    //     script {
    //       def tfHome = tool name: 'Terraform', type: 'org.jenkinsci.plugins.terraform.TerraformInstallation'
    //       def tf = "${tfHome}/bin/terraform"
    //       sh "${tf} plan"
    //     }
    //   }
    // }
    
    // stage('Terraform Apply') {
    //   steps {
    //     script {
    //       def tfHome = tool name: 'Terraform', type: 'org.jenkinsci.plugins.terraform.TerraformInstallation'
    //       def tf = "${tfHome}/bin/terraform"
    //       withCredentials([string(credentialsId: 'your-terraform-service-account-key', variable: 'GOOGLE_CREDENTIALS')]) {
    //         sh """
    //           echo '$GOOGLE_CREDENTIALS' > terraform-credentials.json
    //           export GOOGLE_APPLICATION_CREDENTIALS=terraform-credentials.json
    //           ${tf} apply -auto-approve
    //         """
    //       }
    //     }
    //   }
    // }

  }
}
