require "sqlite3"
require "sequel"
require "bcrypt"
require "csv"
require "database"

DB = Database.db_connect()

DB.drop_table?(:users)

DB.create_table :users do
  primary_key :id
  String :email
  String :first_name
  String :last_name
  String :password
end