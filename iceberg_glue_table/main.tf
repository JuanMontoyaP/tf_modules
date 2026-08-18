resource "aws_glue_catalog_table" "this" {
  name          = var.table_name
  database_name = var.database_name

  open_table_format_input {
    iceberg_input {
      metadata_operation = "CREATE"
      version            = 2

      iceberg_table_input {
        location = "s3://${var.s3_bucket_name}/${var.s3_bucket_prefix}${var.database_name}/${var.table_name}/"

        schema {
          schema_id = 0
          type      = "struct"

          dynamic "fields" {
            for_each = var.schema_fields

            content {
              id       = fields.value.id
              name     = fields.value.name
              required = fields.value.required
              type     = fields.value.type
            }
          }
        }

        partition_spec {
          dynamic "fields" {
            for_each = var.partition_fields

            content {
              name      = fields.value.name
              source_id = fields.value.source_id
              transform = fields.value.transform
            }
          }
        }
      }
    }
  }
}

resource "aws_glue_catalog_table_optimizer" "compaction" {
  catalog_id    = var.catalog_id
  database_name = var.database_name
  table_name    = aws_glue_catalog_table.this.name
  type          = "compaction"

  configuration {
    enabled  = true
    role_arn = var.role_arn

    compaction_configuration {
      iceberg_configuration {
        strategy = var.compaction_strategy
      }
    }
  }
}

resource "aws_glue_catalog_table_optimizer" "snapshot" {
  catalog_id    = var.catalog_id
  database_name = var.database_name
  table_name    = aws_glue_catalog_table.this.name
  type          = "retention"

  configuration {
    role_arn = var.role_arn
    enabled  = true

    retention_configuration {
      iceberg_configuration {
        snapshot_retention_period_in_days = var.snapshot_retention_period_in_days
        number_of_snapshots_to_retain     = var.number_of_snapshots_to_retain
        clean_expired_files               = var.clean_expired_files
      }
    }
  }
}

