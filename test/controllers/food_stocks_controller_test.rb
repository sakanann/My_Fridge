require "test_helper"

class FoodStocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @food_stock = food_stocks(:one)
  end

  test "should get index" do
    get food_stocks_url
    assert_response :success
  end

  test "should get new" do
    get new_food_stock_url
    assert_response :success
  end

  test "should create food_stock" do
    assert_difference('FoodStock.count') do
      post food_stocks_url, params: { food_stock: { consumption: @food_stock.consumption, notes: @food_stock.notes, price: @food_stock.price, use_up_on: @food_stock.use_up_on } }
    end

    assert_redirected_to food_stock_url(FoodStock.last)
  end

  test "should show food_stock" do
    get food_stock_url(@food_stock)
    assert_response :success
  end

  test "should get edit" do
    get edit_food_stock_url(@food_stock)
    assert_response :success
  end

  test "should update food_stock" do
    patch food_stock_url(@food_stock), params: { food_stock: { consumption: @food_stock.consumption, notes: @food_stock.notes, price: @food_stock.price, use_up_on: @food_stock.use_up_on } }
    assert_redirected_to food_stock_url(@food_stock)
  end

  test "should destroy food_stock" do
    assert_difference('FoodStock.count', -1) do
      delete food_stock_url(@food_stock)
    end

    assert_redirected_to food_stocks_url
  end
end
