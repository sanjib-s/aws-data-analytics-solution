variable "db_name" {
  type = string
}

variable "table_name" {
  type = string
}

variable "crawler_name" {
  type = string
}

resource "aws_glue_crawler" "example" {
  name = var.crawler_name
  role = aws_iam_role.example.arn
  database_name = var.db_name
  s3_target {
    path = "s3://example-bucket/data"
  }
}

resource "aws_athena_table" "example" {
  name = var.table_name
  database_name = var.db_name
  table_type = "EXTERNAL_TABLE"
  parameters = {
    "classification" = "json"
    "compressionType" = "none"
    "typeOfData" = "file"
  }
  storage_descriptor {
    columns {
      name = "column1"
      type = "string"
    }
    location = "s3://example-bucket/data"
    input_format = "org.apache.hadoop.mapred.TextInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat"
  }
}

resource "aws_athena_database" "example" {
  name = var.db_name
}
