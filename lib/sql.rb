require_relative '../config/environment'

# https://github.com/sparklemotion/sqlite3-ruby

# Open a database
DB = SQLite3::Database.new 'db/sqlite.db'

# Create a table
rows = DB.execute <<-SQL
  create table numbers (
    name varchar(30),
    val int
  );
SQL

# Execute a few inserts
{
  'one' => 1,
  'two' => 2
}.each do |pair|
  DB.execute 'insert into numbers values ( ?, ? )', pair
end

# Find a few rows
DB.execute('select * from numbers') do |row|
  p row
end
# => ["one", 1]
#    ["two", 2]

# Create another table with multiple columns
DB.execute <<-SQL
  create table students (
    name varchar(50),
    email varchar(50),
    grade varchar(5),
    blog varchar(50)
  );
SQL

# Execute inserts with parameter markers
DB.execute("INSERT INTO students (name, email, grade, blog)
            VALUES (?, ?, ?, ?)", %w[Jane me@janedoe.com A http://blog.janedoe.com])

DB.execute('select * from students') do |row|
  p row
end
# => ["Jane", "me@janedoe.com", "A", "http://blog.janedoe.com"]
