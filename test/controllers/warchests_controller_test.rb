require "test_helper"

class WarchestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @warchest = warchests(:one)
  end

  test "should get index" do
    get warchests_url
    assert_response :success
  end

  test "should get new" do
    get new_warchest_url
    assert_response :success
  end

  test "should create warchest" do
    assert_difference('Warchest.count') do
      post warchests_url, params: { warchest: {  } }
    end

    assert_redirected_to warchest_url(Warchest.last)
  end

  test "should show warchest" do
    get warchest_url(@warchest)
    assert_response :success
  end

  test "should get edit" do
    get edit_warchest_url(@warchest)
    assert_response :success
  end

  test "should update warchest" do
    patch warchest_url(@warchest), params: { warchest: {  } }
    assert_redirected_to warchest_url(@warchest)
  end

  test "should destroy warchest" do
    assert_difference('Warchest.count', -1) do
      delete warchest_url(@warchest)
    end

    assert_redirected_to warchests_url
  end
end
