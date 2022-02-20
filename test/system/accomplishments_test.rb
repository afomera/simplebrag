require "application_system_test_case"

class AccomplishmentsTest < ApplicationSystemTestCase
  setup do
    @accomplishment = accomplishments(:one)
  end

  test "visiting the index" do
    visit accomplishments_url
    assert_selector "h1", text: "Accomplishments"
  end

  test "should create accomplishment" do
    visit accomplishments_url
    click_on "New accomplishment"

    fill_in "Completed at", with: @accomplishment.completed_at
    fill_in "Name", with: @accomplishment.name
    fill_in "User", with: @accomplishment.user_id
    click_on "Create Accomplishment"

    assert_text "Accomplishment was successfully created"
    click_on "Back"
  end

  test "should update Accomplishment" do
    visit accomplishment_url(@accomplishment)
    click_on "Edit this accomplishment", match: :first

    fill_in "Completed at", with: @accomplishment.completed_at
    fill_in "Name", with: @accomplishment.name
    fill_in "User", with: @accomplishment.user_id
    click_on "Update Accomplishment"

    assert_text "Accomplishment was successfully updated"
    click_on "Back"
  end

  test "should destroy Accomplishment" do
    visit accomplishment_url(@accomplishment)
    click_on "Destroy this accomplishment", match: :first

    assert_text "Accomplishment was successfully destroyed"
  end
end
