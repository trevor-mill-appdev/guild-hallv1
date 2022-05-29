require "application_system_test_case"

class GuildsTest < ApplicationSystemTestCase
  setup do
    @guild = guilds(:one)
  end

  test "visiting the index" do
    visit guilds_url
    assert_selector "h1", text: "Guilds"
  end

  test "creating a Guild" do
    visit guilds_url
    click_on "New Guild"

    check "Private" if @guild.private
    fill_in "Prop threshold", with: @guild.prop_threshold
    fill_in "References", with: @guild.references
    click_on "Create Guild"

    assert_text "Guild was successfully created"
    click_on "Back"
  end

  test "updating a Guild" do
    visit guilds_url
    click_on "Edit", match: :first

    check "Private" if @guild.private
    fill_in "Prop threshold", with: @guild.prop_threshold
    fill_in "References", with: @guild.references
    click_on "Update Guild"

    assert_text "Guild was successfully updated"
    click_on "Back"
  end

  test "destroying a Guild" do
    visit guilds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Guild was successfully destroyed"
  end
end
