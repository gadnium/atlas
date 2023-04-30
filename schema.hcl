schema "app" {

}
table "example_table" {
  schema = schema.app
  column "id" {
    null = false
    type = int
  }
  column "title" {
    null = true
    type = varchar(100)
  }
  column "body" {
    null = true
    type = text
  }
  primary_key {
    columns = [column.id]
  }
}
table "users" {
  schema = schema.app
  column "id" {
    type = int
  }
  column "user_name" {
    type   = varchar(255)
    unique = true
  }
  column "email" {
    type   = varchar(255)
    unique = true
  }
  column "name" {
    type = varchar(255)
  }
  primary_key {
    columns = [column.id]
  }
}

table "posts" {
  schema = schema.app
  column "id" {
    type = int
  }
  column "user_id" {
    type = int
  }
  column "title" {
    type = varchar(255)
  }
  column "body" {
    type = text
  }
  primary_key {
    columns = [column.id]
  }
  foreign_key {
    columns    = [column.user_id]
    ref_columns = [table.users.column.id]
    on_delete = CASCADE
    on_update = NO_ACTION
  }
}