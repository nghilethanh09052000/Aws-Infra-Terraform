output "id" {
    description = "Glue Crawler ID."
    value       = local.enabled ? aws_glue_crawler.this[0].id : ""
}

output "name" {
    description = "Glue Crawler name."
    value       = local.enabled ? aws_glue_crawler.this[0].name : ""
}

output "arn" {
    description = "Glue Crawler ARN."
    value       = local.enabled ? aws_glue_crawler.this[0].arn : ""
}
  