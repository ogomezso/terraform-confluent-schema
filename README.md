# terraform-confluent-schema
Confluent Cloud Schema Management

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_confluent"></a> [confluent](#requirement\_confluent) | >=1.51.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_schema"></a> [schema](#module\_schema) | ./schema | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster"></a> [cluster](#input\_cluster) | Schema Registry id where we are creating the new schema | `string` | n/a | yes |
| <a name="input_credentials"></a> [credentials](#input\_credentials) | Confluent Cloud Service Account | <pre>object({<br>    id     = string<br>    secret = string<br>  })</pre> | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Confluent environment id in wich destination Schema Registry Cluster is provisioned | `string` | n/a | yes |
| <a name="input_schemas"></a> [schemas](#input\_schemas) | List of schemas to be created | <pre>list(object({<br>    subject_name                = string<br>    format                      = string<br>    file_path                   = string<br>    subject_compatibility_level = string<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_schemas"></a> [schemas](#output\_schemas) | n/a |
<!-- END_TF_DOCS -->