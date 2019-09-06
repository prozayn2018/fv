require "application_system_test_case"

class MarketsTest < ApplicationSystemTestCase
  setup do
    @market = markets(:one)
  end

  test "visiting the index" do
    visit markets_url
    assert_selector "h1", text: "Markets"
  end

  test "creating a Market" do
    visit markets_url
    click_on "New Market"

    fill_in "Ytd change", with: @market.YTD_change
    fill_in "Current price", with: @market.current_price
    fill_in "Discount value", with: @market.discount_value
    fill_in "Fair value", with: @market.fair_value
    fill_in "Integer", with: @market.integer
    fill_in "Name", with: @market.name
    click_on "Create Market"

    assert_text "Market was successfully created"
    click_on "Back"
  end

  test "updating a Market" do
    visit markets_url
    click_on "Edit", match: :first

    fill_in "Ytd change", with: @market.YTD_change
    fill_in "Current price", with: @market.current_price
    fill_in "Discount value", with: @market.discount_value
    fill_in "Fair value", with: @market.fair_value
    fill_in "Integer", with: @market.integer
    fill_in "Name", with: @market.name
    click_on "Update Market"

    assert_text "Market was successfully updated"
    click_on "Back"
  end

  test "destroying a Market" do
    visit markets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Market was successfully destroyed"
  end
end
