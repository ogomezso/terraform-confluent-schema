# Configure the Confluent Cloud Provider
terraform {
  required_providers {
    confluent = {
      source  = "confluentinc/confluent"
      version = ">=1.51.0"
    }
  } 
  required_version = ">= 1.3.0"
} 
 