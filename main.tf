module "schema" {
  providers = {
    confluent.confluent_cloud = confluent
  }
  for_each = {for schema in var.schemas : schema.subject_name => schema }
  source = "./schema"
  cluster = var.cluster
  environment = var.environment
  schema = each.value
  credentials = var.credentials
}

