# Confluent cloud environment id  
variable "environment" {
  type        = string
  description = "Confluent environment id in wich destination Schema Registry Cluster is provisioned"
}

variable "cluster" {
  type        = string
  description = "Schema Registry id where we are creating the new schema"
}

variable "schemas" {
  type = list(object({
    subject_name                = string
    format                      = string
    file_path                   = string
    subject_compatibility_level = string
  }))
  description = "List of schemas to be created"
}

# Confluent Cloud Service Account  
variable "credentials" {
  type = object({
    id     = string
    secret = string
  })
}
