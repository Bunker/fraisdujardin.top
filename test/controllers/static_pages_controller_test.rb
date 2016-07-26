require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get FAQ" do
    get static_pages_FAQ_url
    assert_response :success
  end

  test "should get About" do
    get static_pages_About_url
    assert_response :success
  end

end
