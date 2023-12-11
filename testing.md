## Test the deployment
Navigate in your browser:http://az-capabilities-dns.eastus2.cloudapp.azure.com/
To test connection between containers:
```bash
    clientId=$(grep 'client_id' dev.auto.tfvars | cut -d '=' -f2 | tr -d ' "')                   
    clientSecret=$(grep 'client_secret' dev.auto.tfvars | cut -d '=' -f2 | tr -d ' "')
    tenantId=$(grep 'tenant_id' dev.auto.tfvars | cut -d '=' -f2 | tr -d ' "')
```
```bash
    az login --service-principal --username $clientId --password $clientSecret --tenant $tenantId
```
```bash
    az container exec --resource-group az-capabilities-rg --name az-capabilties-acg --container-name frontend-container --exec-command "/bin/sh"
    curl -v 10.0.0.4:5002/v1/headquarters
```
