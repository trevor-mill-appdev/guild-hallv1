require "test_helper"

class StashesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stash = stashes(:one)
  end

  test "should get index" do
    get stashes_url
    assert_response :success
  end

  test "should get new" do
    get new_stash_url
    assert_response :success
  end

  test "should create stash" do
    assert_difference('Stash.count') do
      post stashes_url, params: { stash: { material_id: @stash.material_id, owner_id: @stash.owner_id, quantity: @stash.quantity } }
    end

    assert_redirected_to stash_url(Stash.last)
  end

  test "should show stash" do
    get stash_url(@stash)
    assert_response :success
  end

  test "should get edit" do
    get edit_stash_url(@stash)
    assert_response :success
  end

  test "should update stash" do
    patch stash_url(@stash), params: { stash: { material_id: @stash.material_id, owner_id: @stash.owner_id, quantity: @stash.quantity } }
    assert_redirected_to stash_url(@stash)
  end

  test "should destroy stash" do
    assert_difference('Stash.count', -1) do
      delete stash_url(@stash)
    end

    assert_redirected_to stashes_url
  end
end
