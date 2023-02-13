class CreateFoodStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :food_stocks do |t|
      t.date :use_up_on
      t.integer :price
      t.boolean :consumption
      t.string :notes

      t.timestamps
    end
  end
end
