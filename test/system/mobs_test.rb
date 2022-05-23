require "application_system_test_case"

class MobsTest < ApplicationSystemTestCase
  setup do
    @mob = mobs(:one)
  end

  test "visiting the index" do
    visit mobs_url
    assert_selector "h1", text: "Mobs"
  end

  test "creating a Mob" do
    visit mobs_url
    click_on "New Mob"

    fill_in "Image url", with: @mob.image_url
    fill_in "Owner", with: @mob.owner_id
    fill_in "Serial", with: @mob.serial
    click_on "Create Mob"

    assert_text "Mob was successfully created"
    click_on "Back"
  end

  test "updating a Mob" do
    visit mobs_url
    click_on "Edit", match: :first

    fill_in "Image url", with: @mob.image_url
    fill_in "Owner", with: @mob.owner_id
    fill_in "Serial", with: @mob.serial
    click_on "Update Mob"

    assert_text "Mob was successfully updated"
    click_on "Back"
  end

  test "destroying a Mob" do
    visit mobs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mob was successfully destroyed"
  end
end
