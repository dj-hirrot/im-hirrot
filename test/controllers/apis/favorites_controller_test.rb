require 'test_helper'

class Apis::FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get apis_favorites_create_url
    assert_response :success
  end

  test "should get destroy" do
    get apis_favorites_destroy_url
    assert_response :success
  end

end
