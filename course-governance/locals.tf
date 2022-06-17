#####################################################
# IBM Cloud - Terraform Academy Training
# Copyright 2022 IBM
#####################################################

locals {
  data = jsondecode(data.local_file.read_job.content)
}

locals {
  job_destroy_timestamp = timeadd(formatdate("YYYY-MM-DD'T'hh:mm:ssZ", local.data.end_at), var.decomission_timer)
}

locals {
  cron_expr = format("%s %s %s * *", substr(local.job_destroy_timestamp, 14, 2), substr(local.job_destroy_timestamp, 11, 2), substr(local.job_destroy_timestamp, 8, 2))
}