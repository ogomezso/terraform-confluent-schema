# Confluent cloud environment id  
variable "environment" {
  type        = string
  description = "Confluent environment id in wich destination Schema Registry Cluster is provisioned"
}

variable "cluster" {
  type        = string
  description = "Schema Registry id where we are creating the new schema"
}

variable "schema" {
  type = object({
    subject_name                = string
    format                      = string
    file_path                   = string
    subject_compatibility_level = string
  })
  validation {
    condition = (
      contains(["AVRO", "JSON", "PROTOBUF"], var.schema.format)
      && contains(["BACKWARD", "BACKWARD_TRANSITIVE", "FORWARD", "FORWARD_TRANSITIVE", "FULL", "FULL_TRANSITIVE", "NONE"], var.schema.subject_compatibility_level)
    )
    error_message = <<EOT
- subject format => AVRO, JSON or PROTOBUF 
- subject compatibility => BACKWARD, BACKWARD_TRANSITIVE, FORWARD, FORWARD_TRANSITIVE, FULL, FULL_TRANSITIVE or NONE
    EOT
  }
}

# Confluent Cloud Service Account  
variable "credentials" {
  type = object({
    id     = string
    secret = string
  })
}
