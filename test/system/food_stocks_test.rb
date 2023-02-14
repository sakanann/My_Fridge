require "application_system_test_case"

class FoodStocksTest < ApplicationSystemTestCase
  setup do
    @food_stock = food_stocks(:one)
  end

  test "visiting the index" do
    visit food_stocks_url
    assert_selector "h1", text: "Food Stocks"
  end

  test "creating a Food stock" do
    visit food_stocks_url
    click_on "New Food Stock"

    check "Consumption" if @food_stock.consumption
    fill_in "Notes", with: @food_stock.notes
    fill_in "Price", with: @food_stock.price
    fill_in "Use up on", with: @food_stock.use_up_on
    click_on "Create Food stock"

    assert_text "Food stock was successfully created"
    click_on "Back"
  end

  test "updating a Food stock" do
    visit food_stocks_url
    click_on "Edit", match: :first

    check "Consumption" if @food_stock.consumption
    fill_in "Notes", with: @food_stock.notes
    fill_in "Price", with: @food_stock.price
    fill_in "Use up on", with: @food_stock.use_up_on
    click_on "Update Food stock"

    assert_text "Food stock was successfully updated"
    click_on "Back"
  end

  test "destroying a Food stock" do
    visit food_stocks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Food stock was successfully destroyed"
  end
end
