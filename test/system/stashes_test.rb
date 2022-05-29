require "application_system_test_case"

class StashesTest < ApplicationSystemTestCase
  setup do
    @stash = stashes(:one)
  end

  test "visiting the index" do
    visit stashes_url
    assert_selector "h1", text: "Stashes"
  end

  test "creating a Stash" do
    visit stashes_url
    click_on "New Stash"

    fill_in "Material", with: @stash.material_id
    fill_in "Owner", with: @stash.owner_id
    fill_in "Quantity", with: @stash.quantity
    click_on "Create Stash"

    assert_text "Stash was successfully created"
    click_on "Back"
  end

  test "updating a Stash" do
    visit stashes_url
    click_on "Edit", match: :first

    fill_in "Material", with: @stash.material_id
    fill_in "Owner", with: @stash.owner_id
    fill_in "Quantity", with: @stash.quantity
    click_on "Update Stash"

    assert_text "Stash was successfully updated"
    click_on "Back"
  end

  test "destroying a Stash" do
    visit stashes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Stash was successfully destroyed"
  end
end
