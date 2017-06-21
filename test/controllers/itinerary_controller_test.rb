require 'test_helper'

class ItineraryControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get itinerary_create_url
    assert_response :success
  end

end
