require_relative '../config/environment'

# https://www.rubyguides.com/2019/06/ruby-sequel-orm/

DB = Sequel.sqlite('db/database.sqlite3')

DB.create_table :fruits do
  primary_key :id
  column :name, String
  column :amount, Integer
end

table = DB[:fruits]
# Sequel::SQLite::Dataset

table.insert(name: 'Orange', amount: 10)
table.insert(name: 'Apple', amount: 2)
table.insert(name: 'Banana', amount: 7)

puts table.count
# 3

puts table.all
# [
#   { id: 1, name: "Orange", amount: 10 },
#   { id: 2, name: "Apple", amount: 2 },
#   { id: 3, name: "Banana", amount: 7 }
# ]
DB.drop_table :fruits

puts message = DB.table_exists?(:fruits) ? table.all : 'Table does not exist!'
