require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get ui_view" do
    get users_ui_view_url
    assert_response :success
  end
end
