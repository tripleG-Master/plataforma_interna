require "test_helper"

class ScaffoldControllerTest < ActionDispatch::IntegrationTest
  test "should get user" do
    get scaffold_user_url
    assert_response :success
  end
end
