class AddUserIdToFoodStocks < ActiveRecord::Migration[6.1]
  def change
    add_reference :food_stocks, :user, foreign_key: true
  end
end
