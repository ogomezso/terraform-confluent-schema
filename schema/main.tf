data "confluent_schema_registry_cluster" "sr" {
  id = var.cluster
  environment {
    id =var.environment
  }
}
resource "confluent_schema" "schema" {
  schema_registry_cluster {
    id = data.confluent_schema_registry_cluster.sr.id
  }
  rest_endpoint = data.confluent_schema_registry_cluster.sr.rest_endpoint
  subject_name = var.schema.subject_name
  format = var.schema.format
  recreate_on_update = false
  schema = file(var.schema.file_path)
  credentials {
    key    = var.credentials.id
    secret = var.credentials.secret
  }
}

resource "confluent_subject_config" "subject_config" {
  schema_registry_cluster {
    id = data.confluent_schema_registry_cluster.sr.id
  }
  rest_endpoint       = data.confluent_schema_registry_cluster.sr.rest_endpoint
  subject_name        = var.schema.subject_name
  compatibility_level = var.schema.subject_compatibility_level
  credentials {
    key    = var.credentials.id
    secret = var.credentials.secret
  }
}

