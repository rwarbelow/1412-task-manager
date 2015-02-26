require 'sequel'

test_db = Sequel.postgres('task_manager_test')
dev_db  = Sequel.postgres('task_manager_dev')

[test_db, dev_db].each do |database|
  database.create_table :tasks do
    primary_key :id
    String :title
    Text :description
  end
end
