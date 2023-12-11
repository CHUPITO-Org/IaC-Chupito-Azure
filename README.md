## Event Manager - Azure Infrastructure

This repository is a custom deployment of event manager application based on Azure.

## Contents
- [Event Manager](#event-manager---azure-infrastructure)
- [Contents](#contents)
- [Application Architecture](#application-architecture)
- [Dependencies](#dependencies)
- [Project Requirements](#project-requirements)
- [Usage](#usage)

## Application architecture
In order to deploy the application, the following architecture have been designed. 

![Azure architecture](./docs/ADR/v2.0/azure_architecture_2.png)

For more details, please review this section: [ADR](./docs/ADR.md) | [Resources](./docs/README-tech.md)

## Dependencies
Install Terraform for MacOS:
```bash
brew install terraform
terraform -v
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

1. Initialize terraform
```bash
terraform init
```
2. Check the execution plan: 
```bash
terraform plan
```
3. Apply the plan as follows:
- Deploy Resource Group and Azure Container Registry
```bash
terraform apply -target=azurerm_resource_group.az-capabilities-rg -target=module.acr --var-file=dev.auto.tfvars
```
- Upload the frontend, backend and database image to Azure Container Registry
  - Get the app registration credentials
    ```bash
    clientId=$(grep 'client_id' dev.auto.tfvars | cut -d '=' -f2 | tr -d ' "')                   
    clientSecret=$(grep 'client_secret' dev.auto.tfvars | cut -d '=' -f2 | tr -d ' "')
    tenantId=$(grep 'tenant_id' dev.auto.tfvars | cut -d '=' -f2 | tr -d ' "')
    ```
  -  Connect to Azure and connect the Azure Container Registry variables
    ```bash
      az login --service-principal --username $clientId --password $clientSecret --tenant $tenantId
      ACR_LOGIN_SERVER=$(az acr show --name azcapabilitiesacr --query loginServer --output tsv)
      az acr login --name $ACR_LOGIN_SERVER
    ```
  - Upload the images:
    - [Frontend](https://github.com/CHUPITO-Org/FE-Chupito): 
      ```bash
      docker tag [frontend-image] [container-registry-server]/ms-conference-ui
      docker push [container-registry-server]/ms-conference-ui
      ```
    - [Backend](https://github.com/CHUPITO-Org/BE-Chupito/): 
      ```bash
      docker tag [backend-image] [container-registry-server]/ms-conference-bff
      docker push [container-registry-server]/ms-conference-bff
      ```
    - Database:
      ```bash
      docker tag [bd-image] [container-registry-server]/image-mongo:v1
      docker push [container-registry-server]/image-mongo:v1
      ```
  - Deploy all the resources 
  ```bash
  terraform apply --var-file=dev.auto.tfvars
  ```