class FoodStock < ApplicationRecord
  belongs_to :user
  belongs_to :foods
end
