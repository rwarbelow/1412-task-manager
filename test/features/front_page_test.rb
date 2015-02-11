require_relative '../test_helper'

class FrontPageTest < FeatureTest
  def test_user_sees_greeting
    visit '/'
    assert page.has_content?("Welcome to the TaskManager")
  end

  def test_user_sees_index_and_new_links
    # your test code here
  end
end
