output "schemas_id" {
  description = "Map of id values across all schemas, keyed the same as var.schemas except keys with no id are omitted"
  value       = { for k, v in confluent_schema.schemas : k => v.id if v.id != null && length(v.id) > 0 }
}
output "schemas_credentials" {
  description = "Map of credentials values across all schemas, keyed the same as var.schemas except keys with no credentials are omitted"
  value       = { for k, v in confluent_schema.schemas : k => one(v.credentials) if v.credentials != null && length(v.credentials) > 0 }
  sensitive   = true
}
output "schemas_format" {
  description = "Map of format values across all schemas, keyed the same as var.schemas except keys with no format are omitted"
  value       = { for k, v in confluent_schema.schemas : k => v.format if v.format != null && length(v.format) > 0 }
}
output "schemas_hard_delete" {
  description = "Map of hard_delete values across all schemas, keyed the same as var.schemas except keys with no hard_delete are omitted"
  value       = { for k, v in confluent_schema.schemas : k => v.hard_delete if v.hard_delete != null }
}
output "schemas_metadata" {
  description = "Map of metadata values across all schemas, keyed the same as var.schemas except keys with no metadata are omitted"
  value       = { for k, v in confluent_schema.schemas : k => one(v.metadata) if v.metadata != null && length(v.metadata) > 0 }
}
output "schemas_recreate_on_update" {
  description = "Map of recreate_on_update values across all schemas, keyed the same as var.schemas except keys with no recreate_on_update are omitted"
  value       = { for k, v in confluent_schema.schemas : k => v.recreate_on_update if v.recreate_on_update != null }
}
output "schemas_rest_endpoint" {
  description = "Map of rest_endpoint values across all schemas, keyed the same as var.schemas except keys with no rest_endpoint are omitted"
  value       = { for k, v in confluent_schema.schemas : k => v.rest_endpoint if v.rest_endpoint != null && length(v.rest_endpoint) > 0 }
}
output "schemas_ruleset" {
  description = "Map of ruleset values across all schemas, keyed the same as var.schemas except keys with no ruleset are omitted"
  value       = { for k, v in confluent_schema.schemas : k => one(v.ruleset) if v.ruleset != null && length(v.ruleset) > 0 }
}
output "schemas_schema" {
  description = "Map of schema values across all schemas, keyed the same as var.schemas except keys with no schema are omitted"
  value       = { for k, v in confluent_schema.schemas : k => v.schema if v.schema != null && length(v.schema) > 0 }
}
output "schemas_schema_identifier" {
  description = "Map of schema_identifier values across all schemas, keyed the same as var.schemas except keys with no schema_identifier are omitted"
  value       = { for k, v in confluent_schema.schemas : k => v.schema_identifier if v.schema_identifier != null }
}
output "schemas_schema_reference" {
  description = "Map of schema_reference values across all schemas, keyed the same as var.schemas except keys with no schema_reference are omitted"
  value       = { for k, v in confluent_schema.schemas : k => v.schema_reference if v.schema_reference != null && length(v.schema_reference) > 0 }
}
output "schemas_schema_registry_cluster" {
  description = "Map of schema_registry_cluster values across all schemas, keyed the same as var.schemas except keys with no schema_registry_cluster are omitted"
  value       = { for k, v in confluent_schema.schemas : k => one(v.schema_registry_cluster) if v.schema_registry_cluster != null && length(v.schema_registry_cluster) > 0 }
}
output "schemas_skip_validation_during_plan" {
  description = "Map of skip_validation_during_plan values across all schemas, keyed the same as var.schemas except keys with no skip_validation_during_plan are omitted"
  value       = { for k, v in confluent_schema.schemas : k => v.skip_validation_during_plan if v.skip_validation_during_plan != null }
}
output "schemas_subject_name" {
  description = "Map of subject_name values across all schemas, keyed the same as var.schemas except keys with no subject_name are omitted"
  value       = { for k, v in confluent_schema.schemas : k => v.subject_name if v.subject_name != null && length(v.subject_name) > 0 }
}
output "schemas_version" {
  description = "Map of version values across all schemas, keyed the same as var.schemas except keys with no version are omitted"
  value       = { for k, v in confluent_schema.schemas : k => v.version if v.version != null }
}

