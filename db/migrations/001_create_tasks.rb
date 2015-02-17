require 'sequel'

databases = [Sequel.sqlite('db/task_manager_test.sqlite3'), Sequel.sqlite('db/task_manager_dev.sqlite3')]

databases.each do |database|
  database.create_table :tasks do
    primary_key :id
    String :title
    Text :description
  end
end
