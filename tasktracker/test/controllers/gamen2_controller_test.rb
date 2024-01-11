require "test_helper"

class Gamen2ControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gamen2_index_url
    assert_response :success
  end
end
