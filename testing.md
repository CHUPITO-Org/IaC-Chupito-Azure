## Test the deployment
Navigate in your browser with the DNS of your public IP
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
    az container exec --resource-group [resoure-group-name] --name [acg-name] --container-name [frontend-container-name] --exec-command "/bin/sh"
    curl -v [acg-ip]:5002/v1/headquarters
```
