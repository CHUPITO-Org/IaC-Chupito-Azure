# tf-module-template

Template for creating terraform module repo.

## Needs

- Download all the linter dependencies
- Change the URL parameter in .github/workflows/cliff.toml with the repository URL so the commits can be shown on the CHANGELOG.md file

#### Pre-commit hook

The template utilizes pre-commit hooks to run the linters before committing the code, if you are using starting the template for the first time, you need to enable the pre-commit, after that it will work for all subsecuents commits. To use the To install the pre-commit hooks run the following command:

```bash
pre-commit install
```

#### Hook Process

After that the pre-commit will check

- Terraform fmt
- Terraform tflint
- Terraform tfsec
- Terraform validate
- Terraform docs (if the tf-docs isn't updated the is going to overrite the README.md file)
- It will check for [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.0.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.0.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acg"></a> [acg](#module\_acg) | ./modules/container-instance | n/a |
| <a name="module_acr"></a> [acr](#module\_acr) | ./modules/container-registry | n/a |
| <a name="module_network"></a> [network](#module\_network) | ./modules/network | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.az-capabilities-rg](https://registry.terraform.io/providers/hashicorp/azurerm/3.0.1/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acg_name"></a> [acg\_name](#input\_acg\_name) | Name of the container group | `string` | n/a | yes |
| <a name="input_aci_name"></a> [aci\_name](#input\_aci\_name) | Name of the container instance | `string` | n/a | yes |
| <a name="input_acr_name"></a> [acr\_name](#input\_acr\_name) | Name of the container registry | `string` | n/a | yes |
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | Address space of the virtual network | `list(string)` | <pre>[<br>  "10.0.0.0/16"<br>]</pre> | no |
| <a name="input_admin_enabled"></a> [admin\_enabled](#input\_admin\_enabled) | Admin enabled | `bool` | n/a | yes |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | Terraform Cloud connection | `string` | n/a | yes |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | n/a | `string` | n/a | yes |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | value of cpu | `number` | `1` | no |
| <a name="input_ip_address_type"></a> [ip\_address\_type](#input\_ip\_address\_type) | Type of ip address: private or public | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location | `string` | n/a | yes |
| <a name="input_memory"></a> [memory](#input\_memory) | value of memory | `number` | `1` | no |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | Type of os\_type | `string` | `"Linux"` | no |
| <a name="input_port"></a> [port](#input\_port) | value of port | `number` | n/a | yes |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | value of protocol | `string` | `"TCP"` | no |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | Name of the resource group | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | Level o sku | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | n/a | `string` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | n/a | `string` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Name of the virtual network | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
