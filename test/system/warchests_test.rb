require "application_system_test_case"

class WarchestsTest < ApplicationSystemTestCase
  setup do
    @warchest = warchests(:one)
  end

  test "visiting the index" do
    visit warchests_url
    assert_selector "h1", text: "Warchests"
  end

  test "creating a Warchest" do
    visit warchests_url
    click_on "New Warchest"

    click_on "Create Warchest"

    assert_text "Warchest was successfully created"
    click_on "Back"
  end

  test "updating a Warchest" do
    visit warchests_url
    click_on "Edit", match: :first

    click_on "Update Warchest"

    assert_text "Warchest was successfully updated"
    click_on "Back"
  end

  test "destroying a Warchest" do
    visit warchests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Warchest was successfully destroyed"
  end
end
