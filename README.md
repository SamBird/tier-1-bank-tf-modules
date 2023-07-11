
# Terraform Modules Repository

This repository contains a collection of reusable Terraform modules for provisioning infrastructure in [Google Cloud Platform (GCP)](https://cloud.google.com/). Each module focuses on a specific component or resource, providing a consistent and modular approach to infrastructure provisioning.

## Modules

The following modules are available in this repository:

-   [gcp-vpc](): Creates a private VPC network in GCP.
-   [gcp-gke](): Creates a Google Kuberentes Enginer Cluster in GCP.
-   [gcp-project]: Creates a GCP project and associated API's.

## Usage

To use a module, include it in your Terraform configuration by referencing its source location in the module block. For example:

    module "vpc" {
      source = "github.com/SamBird/tier-1-bank-tf-modules/gcp-vpc"
    
      project_id = "your-project-id"
      network_name = "your-vpc-network"
      subnet_name = "your-subnet"
      subnet_cidr = "10.0.0.0/24"
    } 

Refer to the individual module directories for more details on the required input variables and other configuration options.

For additional information on Terraform, refer to the [official Terraform documentation](https://www.terraform.io/docs/index.html).
