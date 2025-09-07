module "entity_resolution_glue_crawler" {
    source = "terraform-aws-modules/glue/aws//modules/crawler-entity-resolution"
    
    crawler_name = "test_entity_resolution_crawler" 
    crawler_description = "Test Glue Crawler for Entity Resolution"
    role_arn = "arn:aws:iam::123456789012:role/aws-glue-service-role"
    database_name = "test_entity_resolution"
    enabled = true

    schema_change_policy = {
        update_behavior = "UPDATE_IN_DATABASE"
        delete_behavior = "LOG"
    }

    s3_targets = [
        {
            path = "s3://entity-resolution-data/"
            exclusions = ["*.tmp", "*.log"]
        }
    ]

    configuration = jsonencode(
        {
            Version = 1.0

            Grouping = {
                TableGroupingPolicy = "CombineCompatibleSchemas"
            }

            CrawlerOutput = {
                Partitions = {
                    AddOrUpdateBehavior = "InheritFromTable"
                }
                Tables = {
                    AddOrUpdateBehavior = "MergeNewColumns"
                }
            }
        }
    )
}