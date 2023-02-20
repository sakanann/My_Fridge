class AddNotNullConstraintToConsumptionColumnInFoodStocks < ActiveRecord::Migration[6.1]
  def change
    change_column :food_stocks, :consumption, :boolean, null: false, default: false
  end
end
