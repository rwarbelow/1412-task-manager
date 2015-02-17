require_relative '../test_helper'

class UserEditsTaskTest < FeatureTest
  def test_user_edits_a_task
    # create a task so that we have something to edit
    TaskManager.create({ :title       => "original title", 
                         :description => "original description"})

    # visit the edit path of the task we want to edit
    visit '/tasks/1/edit'

    # change the content of the form fields
    fill_in 'task[title]', with: 'new title'
    fill_in 'task[description]', with: 'new description'
    click_link_or_button('Update task')

    # make sure we were redirected to the task show page
    assert_equal '/tasks/1', current_path

    # assert that the new title and new description appear on the page
    within('#title') do 
      assert page.has_content?('new title')
    end
    within('#description') do 
      assert page.has_content?('new description')
    end
  end

  def test_user_deletes_a_task
    TaskManager.create({ :title       => "original title", 
                         :description => "original description"})
    visit '/tasks'
    
    assert page.has_content?("original title")
    click_link_or_button('delete')
    assert_equal '/tasks', current_path
    refute page.has_content?("original title")
  end
end


