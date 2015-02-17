require_relative '../test_helper'

class TaskManagerTest < ModelTest
  def create_task(num)
    num.times do |x|
      x += 1
      TaskManager.create({ :title       => "Title - #{x}",
       :description => "Description - #{x}"})
    end
  end

  def test_it_creates_a_task
    create_task(1)
    task = TaskManager.find(1)
    assert_equal "Title - 1", task.title
    assert_equal "Description - 1", task.description
    assert_equal 1, task.id
  end

  def test_it_finds_task_by_id
    create_task(3)
    task = TaskManager.find(2)
    assert_equal "Title - 2", task.title
  end

  def test_it_can_update_a_task
    create_task(1)
    task = TaskManager.find(1)
    assert_equal "Title - 1", task.title
    TaskManager.update(1, {:title => "a new title - 1"})
    task = TaskManager.find(1)
    assert_equal "a new title - 1", task.title
  end

  def test_it_can_delete_a_task
    create_task(2)
    tasks = TaskManager.all
    assert_equal 2, tasks.count
    TaskManager.delete(1)
    tasks = TaskManager.all
    assert_equal 1, tasks.count
  end
end
