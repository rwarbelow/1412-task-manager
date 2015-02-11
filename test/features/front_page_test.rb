require_relative '../test_helper'

class CreateATaskTest < FeatureTest
  def test_user_can_create_a_task
    TaskManager.create({ :title       => "a title", 
                         :description => "a description",
                         :id          => 1 })
    visit '/tasks'
    assert page.has_content?("All Tasks")
  end
end
