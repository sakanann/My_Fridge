class AddFoodIdToFoodStocks < ActiveRecord::Migration[6.1]
  def change
    add_reference :food_stocks, :food, foreign_key: true
  end
end
