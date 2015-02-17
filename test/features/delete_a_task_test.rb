# require_relative '../test_helper'

# class DeleteTaskTest < FeatureTest

#   def test_user_delete_a_task
#     task = ({ :title       => "a title",
#               :description => "a description" })
#     TaskManager.create(task)
#     assert_equal 1, TaskManager.all.count
#     visit '/tasks'
#     assert page.has_content? "a title"
#     click_link_or_button 'delete'
#     assert_equal '/tasks', current_path
#     assert_equal 0, TaskManager.all.count
#     refute page.has_content?('a title')
#   end
# end
