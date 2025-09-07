module "glue_catalog_database" {
    source = "terraform-aws-modules/glue/aws//modules/catalog-database"
    
    enabled = true
    catalog_database_name = "test_glue_catalog_database"
    catalog_database_description = "Test Glue Catalog Database"
}

module "glue_catalog_database_entity_resolution" {
    source = "terraform-aws-modules/glue/aws//modules/catalog-database-entity-resolution"
    
    enabled = true
    catalog_database_name = "test_entity_resolution"
    catalog_database_description = "Test Glue Catalog Database for Entity Resolution"
  
}