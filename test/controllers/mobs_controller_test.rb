require "test_helper"

class MobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mob = mobs(:one)
  end

  test "should get index" do
    get mobs_url
    assert_response :success
  end

  test "should get new" do
    get new_mob_url
    assert_response :success
  end

  test "should create mob" do
    assert_difference('Mob.count') do
      post mobs_url, params: { mob: { image_url: @mob.image_url, owner_id: @mob.owner_id, serial: @mob.serial } }
    end

    assert_redirected_to mob_url(Mob.last)
  end

  test "should show mob" do
    get mob_url(@mob)
    assert_response :success
  end

  test "should get edit" do
    get edit_mob_url(@mob)
    assert_response :success
  end

  test "should update mob" do
    patch mob_url(@mob), params: { mob: { image_url: @mob.image_url, owner_id: @mob.owner_id, serial: @mob.serial } }
    assert_redirected_to mob_url(@mob)
  end

  test "should destroy mob" do
    assert_difference('Mob.count', -1) do
      delete mob_url(@mob)
    end

    assert_redirected_to mobs_url
  end
end
