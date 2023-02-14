class AddFoodIdToFoodStocks < ActiveRecord::Migration[6.1]
  def change
    add_reference :food_stocks, :foods, foreign_key: true
  end
end
