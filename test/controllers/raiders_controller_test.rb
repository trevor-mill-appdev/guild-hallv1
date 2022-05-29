require "test_helper"

class RaidersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @raider = raiders(:one)
  end

  test "should get index" do
    get raiders_url
    assert_response :success
  end

  test "should get new" do
    get new_raider_url
    assert_response :success
  end

  test "should create raider" do
    assert_difference('Raider.count') do
      post raiders_url, params: { raider: { image_url: @raider.image_url, owner_id: @raider.owner_id, serial: @raider.serial } }
    end

    assert_redirected_to raider_url(Raider.last)
  end

  test "should show raider" do
    get raider_url(@raider)
    assert_response :success
  end

  test "should get edit" do
    get edit_raider_url(@raider)
    assert_response :success
  end

  test "should update raider" do
    patch raider_url(@raider), params: { raider: { image_url: @raider.image_url, owner_id: @raider.owner_id, serial: @raider.serial } }
    assert_redirected_to raider_url(@raider)
  end

  test "should destroy raider" do
    assert_difference('Raider.count', -1) do
      delete raider_url(@raider)
    end

    assert_redirected_to raiders_url
  end
end
