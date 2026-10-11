resource "confluent_schema" "schemas" {
  for_each = var.schemas

  format                      = each.value.format
  subject_name                = each.value.subject_name
  hard_delete                 = each.value.hard_delete
  recreate_on_update          = each.value.recreate_on_update
  rest_endpoint               = each.value.rest_endpoint
  schema                      = each.value.schema
  skip_validation_during_plan = each.value.skip_validation_during_plan

  dynamic "credentials" {
    for_each = each.value.credentials != null ? [each.value.credentials] : []
    content {
      key    = credentials.value.key
      secret = credentials.value.secret
    }
  }

  dynamic "metadata" {
    for_each = each.value.metadata != null ? [each.value.metadata] : []
    content {
      properties = metadata.value.properties
      sensitive  = metadata.value.sensitive
      dynamic "tags" {
        for_each = metadata.value.tags != null ? metadata.value.tags : []
        content {
          key   = tags.value.key
          value = tags.value.value
        }
      }
    }
  }

  dynamic "ruleset" {
    for_each = each.value.ruleset != null ? [each.value.ruleset] : []
    content {
      dynamic "domain_rules" {
        for_each = ruleset.value.domain_rules != null ? ruleset.value.domain_rules : []
        content {
          disabled   = domain_rules.value.disabled
          doc        = domain_rules.value.doc
          expr       = domain_rules.value.expr
          kind       = domain_rules.value.kind
          mode       = domain_rules.value.mode
          name       = domain_rules.value.name
          on_failure = domain_rules.value.on_failure
          on_success = domain_rules.value.on_success
          params     = domain_rules.value.params
          tags       = domain_rules.value.tags
          type       = domain_rules.value.type
        }
      }
      dynamic "encoding_rules" {
        for_each = ruleset.value.encoding_rules != null ? ruleset.value.encoding_rules : []
        content {
          disabled   = encoding_rules.value.disabled
          doc        = encoding_rules.value.doc
          expr       = encoding_rules.value.expr
          kind       = encoding_rules.value.kind
          mode       = encoding_rules.value.mode
          name       = encoding_rules.value.name
          on_failure = encoding_rules.value.on_failure
          on_success = encoding_rules.value.on_success
          params     = encoding_rules.value.params
          tags       = encoding_rules.value.tags
          type       = encoding_rules.value.type
        }
      }
      dynamic "migration_rules" {
        for_each = ruleset.value.migration_rules != null ? ruleset.value.migration_rules : []
        content {
          disabled   = migration_rules.value.disabled
          doc        = migration_rules.value.doc
          expr       = migration_rules.value.expr
          kind       = migration_rules.value.kind
          mode       = migration_rules.value.mode
          name       = migration_rules.value.name
          on_failure = migration_rules.value.on_failure
          on_success = migration_rules.value.on_success
          params     = migration_rules.value.params
          tags       = migration_rules.value.tags
          type       = migration_rules.value.type
        }
      }
    }
  }

  dynamic "schema_reference" {
    for_each = each.value.schema_reference != null ? each.value.schema_reference : []
    content {
      name         = schema_reference.value.name
      subject_name = schema_reference.value.subject_name
      version      = schema_reference.value.version
    }
  }

  dynamic "schema_registry_cluster" {
    for_each = each.value.schema_registry_cluster != null ? [each.value.schema_registry_cluster] : []
    content {
      id = schema_registry_cluster.value.id
    }
  }
}

