class AddNotNullConstraintToConsumptionColumnInFoodStocks < ActiveRecord::Migration[6.1]
  def change
    change_column_null :food_stocks, :consumption, false
  end
end
