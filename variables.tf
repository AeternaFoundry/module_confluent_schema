variable "schemas" {
  description = <<EOT
Map of schemas, attributes below
Required:
    - format
    - subject_name
Optional:
    - hard_delete
    - recreate_on_update
    - rest_endpoint
    - schema
    - skip_validation_during_plan
    - credentials (block):
        - key (required)
        - secret (required)
    - metadata (block):
        - properties (optional)
        - sensitive (optional)
        - tags (optional, block):
            - key (optional)
            - value (optional)
    - ruleset (block):
        - domain_rules (optional, block):
            - disabled (optional)
            - doc (optional)
            - expr (optional)
            - kind (required)
            - mode (required)
            - name (required)
            - on_failure (optional)
            - on_success (optional)
            - params (optional)
            - tags (optional)
            - type (required)
        - encoding_rules (optional, block):
            - disabled (optional)
            - doc (optional)
            - expr (optional)
            - kind (required)
            - mode (required)
            - name (required)
            - on_failure (optional)
            - on_success (optional)
            - params (optional)
            - tags (optional)
            - type (required)
        - migration_rules (optional, block):
            - disabled (optional)
            - doc (optional)
            - expr (optional)
            - kind (required)
            - mode (required)
            - name (required)
            - on_failure (optional)
            - on_success (optional)
            - params (optional)
            - tags (optional)
            - type (required)
    - schema_reference (block):
        - name (required)
        - subject_name (required)
        - version (required)
    - schema_registry_cluster (block):
        - id (required)
EOT

  type = map(object({
    format                      = string
    subject_name                = string
    hard_delete                 = optional(bool)
    recreate_on_update          = optional(bool)
    rest_endpoint               = optional(string)
    schema                      = optional(string)
    skip_validation_during_plan = optional(bool)
    credentials = optional(object({
      key    = string
      secret = string
    }))
    metadata = optional(object({
      properties = optional(map(string))
      sensitive  = optional(set(string))
      tags = optional(list(object({
        key   = optional(string)
        value = optional(set(string))
      })))
    }))
    ruleset = optional(object({
      domain_rules = optional(list(object({
        disabled   = optional(bool)
        doc        = optional(string)
        expr       = optional(string)
        kind       = string
        mode       = string
        name       = string
        on_failure = optional(string)
        on_success = optional(string)
        params     = optional(map(string))
        tags       = optional(set(string))
        type       = string
      })))
      encoding_rules = optional(list(object({
        disabled   = optional(bool)
        doc        = optional(string)
        expr       = optional(string)
        kind       = string
        mode       = string
        name       = string
        on_failure = optional(string)
        on_success = optional(string)
        params     = optional(map(string))
        tags       = optional(set(string))
        type       = string
      })))
      migration_rules = optional(list(object({
        disabled   = optional(bool)
        doc        = optional(string)
        expr       = optional(string)
        kind       = string
        mode       = string
        name       = string
        on_failure = optional(string)
        on_success = optional(string)
        params     = optional(map(string))
        tags       = optional(set(string))
        type       = string
      })))
    }))
    schema_reference = optional(list(object({
      name         = string
      subject_name = string
      version      = number
    })))
    schema_registry_cluster = optional(object({
      id = string
    }))
  }))
  # Note: 8 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

