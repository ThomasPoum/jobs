require "application_system_test_case"

class JoboffersTest < ApplicationSystemTestCase
  setup do
    @joboffer = joboffers(:one)
  end

  test "visiting the index" do
    visit joboffers_url
    assert_selector "h1", text: "Joboffers"
  end

  test "creating a Joboffer" do
    visit joboffers_url
    click_on "New Joboffer"

    fill_in "Description", with: @joboffer.description
    fill_in "Title", with: @joboffer.title
    click_on "Create Joboffer"

    assert_text "Joboffer was successfully created"
    click_on "Back"
  end

  test "updating a Joboffer" do
    visit joboffers_url
    click_on "Edit", match: :first

    fill_in "Description", with: @joboffer.description
    fill_in "Title", with: @joboffer.title
    click_on "Update Joboffer"

    assert_text "Joboffer was successfully updated"
    click_on "Back"
  end

  test "destroying a Joboffer" do
    visit joboffers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Joboffer was successfully destroyed"
  end
end
