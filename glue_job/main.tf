resource "aws_s3_object" "this" {
  bucket = var.scripts_bucket
  key    = var.script_key
  source = var.source_script
  etag   = filemd5(var.source_script)
}

resource "aws_glue_job" "this" {
  name              = var.glue_job_name
  description       = var.glue_job_description
  role_arn          = var.glue_job_role_arn
  max_retries       = var.retry_limit
  number_of_workers = var.number_of_workers
  worker_type       = var.worker_type
  execution_class   = var.execution_class

  command {
    name            = var.command.name
    script_location = "s3://${aws_s3_object.this.id}"
    python_version  = var.command.python_version
  }

  execution_property {
    max_concurrent_runs = var.max_concurrent_runs
  }

  default_arguments = var.default_args
}
