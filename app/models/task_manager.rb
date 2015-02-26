require 'yaml/store'

class TaskManager
  def self.database
    if ENV["TASK_MANAGER_ENV"] == 'test'
      @database ||= Sequel.postgres('task_manager_test')
    else
      @database ||= Sequel.postgres('task_manager_dev')
    end
  end

  def self.create(task)
    table.insert(task)
  end

  def self.all
    table.map { |data| Task.new(data) }
  end

  def self.raw_task(id)
    table.where(:id => id).first
  end

  def self.find(id)
    Task.new(raw_task(id))
  end

  def self.update(id, task)
    table.where(:id => id)
         .update(:title => task[:title], :description => task[:description])
  end

  def self.delete(id)
    table.where(:id => id).delete()
  end

  def self.delete_all
    table.delete
  end

  private

  def self.table
    database[:tasks]
  end
end
