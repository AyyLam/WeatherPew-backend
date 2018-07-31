require 'test_helper'

class CityUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @city_user = city_users(:one)
  end

  test "should get index" do
    get city_users_url, as: :json
    assert_response :success
  end

  test "should create city_user" do
    assert_difference('CityUser.count') do
      post city_users_url, params: { city_user: { city_id: @city_user.city_id, user_id: @city_user.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show city_user" do
    get city_user_url(@city_user), as: :json
    assert_response :success
  end

  test "should update city_user" do
    patch city_user_url(@city_user), params: { city_user: { city_id: @city_user.city_id, user_id: @city_user.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy city_user" do
    assert_difference('CityUser.count', -1) do
      delete city_user_url(@city_user), as: :json
    end

    assert_response 204
  end
end
