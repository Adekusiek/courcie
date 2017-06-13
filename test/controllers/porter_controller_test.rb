require 'test_helper'

class PorterControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get porter_top_url
    assert_response :success
  end

end
