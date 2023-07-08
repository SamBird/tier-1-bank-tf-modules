
# Terraform Modules Repository

This repository contains a collection of reusable Terraform modules for provisioning infrastructure in [Google Cloud Platform (GCP)](https://cloud.google.com/). Each module focuses on a specific component or resource, providing a consistent and modular approach to infrastructure provisioning.

## Modules

The following modules are available in this repository:

-   [gcp-vpc](): Creates a private VPC network in GCP.
-   [gcp-organisation](): Creates an organisation and links it to a billing account in GCP.
-   [gcp-gke](): Creates a Google Kuberentes Enginer Cluster in GCP.
-   [gcp-load-balancer]: Creates a load balancer in GCP.

## Usage

To use a module, include it in your Terraform configuration by referencing its source location in the module block. For example:

    module "vpc" {
      source = "github.com/your-repo/gcp-vpc"
    
      project_id = "your-project-id"
      network_name = "my-vpc-network"
      subnet_name = "my-subnet"
      subnet_cidr = "10.0.0.0/24"
    } 

Replace `github.com/your-repo/gcp-vpc` with the appropriate source location for the module.

Refer to the individual module directories for more details on the required input variables and other configuration options.

## Contributing

Contributions to this repository are welcome! If you encounter any issues, have suggestions, or want to add new modules, please submit an issue or a pull request. Make sure to follow the contribution guidelines outlined in the repository's CONTRIBUTING.md file.

## License

This repository is licensed under the [MIT License](). Feel free to use the modules, modify them, or distribute them as needed.

## Disclaimer

These Terraform modules are provided as-is, without any warranties or guarantees. It's recommended to review and understand each module's documentation and test thoroughly before deploying them in a production environment. The authors and contributors of this repository are not responsible for any potential damages or issues resulting from the use of these modules.

For additional information on Terraform, refer to the [official Terraform documentation](https://www.terraform.io/docs/index.html).

Feel free to customise this README file to suit the specific needs and conventions of your Terraform modules repository.