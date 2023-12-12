## Event Manager - Azure Infrastructure

This repository is a custom deployment of event manager application based on Azure.

## Contents
- [Event Manager](#event-manager---azure-infrastructure)
- [Contents](#contents)
- [Application Architecture](#application-architecture)
- [Dependencies](#dependencies)
- [Project Requirements](#project-requirements)
- [Usage](#usage)
- [Testing](#testing)

## Application architecture
In order to deploy the application, the following architecture have been designed. 

![Azure architecture](./docs/ADR/v2.0/azure_architecture_2.png)

For more details, please review this section: [ADR](./docs/ADR.md) | [Resources](./docs/README-tech.md)

## Dependencies
- Install Terraform for MacOS:
  ```bash
  brew install terraform
  terraform -v
  ```
- Install the pre-commit hooks:
  ```bash
  pre-commit install
  ```
  
## Project Requirements
If you are using the Azure project's account, ignore the first step and request the credentials:
1. If you are using a personal Azure account:
  - Create an Application Registration, give Contributor role and save the credentials. 
2. Copy the `terraform.tfvars.example` file and rename it as `.dev.auto.tfvars`. Then, configure the terraform variables according to your specific app registration:

| Key                       | Description                                               |
| :-------------------------| :-------------------------------------------------------- |
| **client_id**             | App registration credential: Client ID                    |
| **client_secret**         | App registration credential: Client Secret                |
| **subscription_id**       | App registration credential: Subscription ID              |
| **tenant_id**             | App registration credential: Tenant ID                    |

## Usage

### Local deployment

1. Deploy the resources: Resource group, Container registry
2. Upload images: Frontend, Backend and Database to your container registry
3. Deploy all the resources

### Remote deployment
1. Request access to Terraform Cloud Workspace
2. If necessary, update the Environment Variables
3. Every time you push to your Git repository, Terraform Cloud will automatically execute a Terraform plan

For more details, see the official Terraform Cloud documentation.

## Testing

For testing: [Here](./testing.md)