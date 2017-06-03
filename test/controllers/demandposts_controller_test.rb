require 'test_helper'

class DemandpostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @demandpost = demandposts(:one)
  end

  test "should get index" do
    get demandposts_url
    assert_response :success
  end

  test "should get new" do
    get new_demandpost_url
    assert_response :success
  end

  test "should create demandpost" do
    assert_difference('Demandpost.count') do
      post demandposts_url, params: { demandpost: { city: @demandpost.city, course_description: @demandpost.course_description, expire_date: @demandpost.expire_date, meeting_place: @demandpost.meeting_place, money_description: @demandpost.money_description, money_ok: @demandpost.money_ok, no_money_description: @demandpost.no_money_description, no_money_ok: @demandpost.no_money_ok, user_id: @demandpost.user_id } }
    end

    assert_redirected_to demandpost_url(Demandpost.last)
  end

  test "should show demandpost" do
    get demandpost_url(@demandpost)
    assert_response :success
  end

  test "should get edit" do
    get edit_demandpost_url(@demandpost)
    assert_response :success
  end

  test "should update demandpost" do
    patch demandpost_url(@demandpost), params: { demandpost: { city: @demandpost.city, course_description: @demandpost.course_description, expire_date: @demandpost.expire_date, meeting_place: @demandpost.meeting_place, money_description: @demandpost.money_description, money_ok: @demandpost.money_ok, no_money_description: @demandpost.no_money_description, no_money_ok: @demandpost.no_money_ok, user_id: @demandpost.user_id } }
    assert_redirected_to demandpost_url(@demandpost)
  end

  test "should destroy demandpost" do
    assert_difference('Demandpost.count', -1) do
      delete demandpost_url(@demandpost)
    end

    assert_redirected_to demandposts_url
  end
end
