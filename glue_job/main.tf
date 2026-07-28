resource "aws_glue_job" "this" {
  name              = var.glue_job_name
  description       = var.glue_job_description
  role_arn          = var.glue_job_role_arn
  max_retries       = var.retry_limit
  number_of_workers = var.number_of_workers
  worker_type       = var.worker_type
  execution_class   = var.execution_class

  command {
    name            = "glueetl"
    script_location = var.script_location
    python_version  = "3"
  }

  execution_property {
    max_concurrent_runs = 1
  }

  default_arguments = {
    "--job-language"                     = "python"
    "--TempDir"                          = "s3://${var.temp_dir_bucket}/temp/"
    "--continuous-log-logGroup"          = "/aws-glue/jobs"
    "--enable-continuous-cloudwatch-log" = "true"
    "--enable-continuous-log-filter"     = "true"
    "--enable-metrics"                   = ""
  }

  lifecycle {
    ignore_changes = [
      tags,
      tags_all
    ]
  }
}
