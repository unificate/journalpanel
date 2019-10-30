require 'test_helper'

class AdminPageControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get admin_page_login_url
    assert_response :success
  end

end
