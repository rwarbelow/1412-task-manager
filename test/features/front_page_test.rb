require_relative '../test_helper'

class FrontPageTest < FeatureTest
  def test_user_sees_index_and_new_links
    visit '/'
    assert page.has_content?("Task Index")
    assert page.has_content?("New Task")
  end
end
