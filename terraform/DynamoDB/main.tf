resource "aws_dynamodb_table" "dynamodb_movie_table" {
  name           = "movies"
  hash_key       = "movieID"
  billing_mode   = "PROVISIONED"
  read_capacity  = "10"
  write_capacity = "10"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "movieID"
    type = "N"
  }
  server_side_encryption {
    enabled = true
  }
  replica {
    region_name = var.region_key
  }

}