require 'test_helper'

class MessageboxesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @messagebox = messageboxes(:one)
  end

  test "should get index" do
    get messageboxes_url
    assert_response :success
  end

  test "should get new" do
    get new_messagebox_url
    assert_response :success
  end

  test "should create messagebox" do
    assert_difference('Messagebox.count') do
      post messageboxes_url, params: { messagebox: { message_id: @messagebox.message_id } }
    end

    assert_redirected_to messagebox_url(Messagebox.last)
  end

  test "should show messagebox" do
    get messagebox_url(@messagebox)
    assert_response :success
  end

  test "should get edit" do
    get edit_messagebox_url(@messagebox)
    assert_response :success
  end

  test "should update messagebox" do
    patch messagebox_url(@messagebox), params: { messagebox: { message_id: @messagebox.message_id } }
    assert_redirected_to messagebox_url(@messagebox)
  end

  test "should destroy messagebox" do
    assert_difference('Messagebox.count', -1) do
      delete messagebox_url(@messagebox)
    end

    assert_redirected_to messageboxes_url
  end
end
