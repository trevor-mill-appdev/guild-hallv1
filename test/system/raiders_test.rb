require "application_system_test_case"

class RaidersTest < ApplicationSystemTestCase
  setup do
    @raider = raiders(:one)
  end

  test "visiting the index" do
    visit raiders_url
    assert_selector "h1", text: "Raiders"
  end

  test "creating a Raider" do
    visit raiders_url
    click_on "New Raider"

    fill_in "Image url", with: @raider.image_url
    fill_in "Owner", with: @raider.owner_id
    fill_in "Serial", with: @raider.serial
    click_on "Create Raider"

    assert_text "Raider was successfully created"
    click_on "Back"
  end

  test "updating a Raider" do
    visit raiders_url
    click_on "Edit", match: :first

    fill_in "Image url", with: @raider.image_url
    fill_in "Owner", with: @raider.owner_id
    fill_in "Serial", with: @raider.serial
    click_on "Update Raider"

    assert_text "Raider was successfully updated"
    click_on "Back"
  end

  test "destroying a Raider" do
    visit raiders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Raider was successfully destroyed"
  end
end
