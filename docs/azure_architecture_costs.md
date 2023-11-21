# Azure Architecture

## Infrastructure

### Version 1

![Azure architecture](./ADR/v1.0/azure_architecture.png)

## Version 2

![Azure architecture](./ADR/v2.0/azure_architecture_2.png)

## Resources

* Virtual Network
* Container Instances
* CosmosDB for MongoDB
* Load Balancer
* Container Registry
* Public Ip

## Infrastructure Cost

Costo por mes durante 24 horas:

* Virtual Network: 4 USD
* Container Instance: 32.81 USD  - 1 Container group: 2 instances
* CosmosDB for MongoDB: 23.36 USD - Standard provisioned throughput
* Load Balancer: 23.25 USD
* Azure Container Registry: 5 USD - Standard Tier
* Ip address: 3.65 USD - Standard Tier

**Total cost: 65.17 USD**

**Azure Calculator:** https://azure.com/e/b40d08f1816648fe93622ea4af4d6c74