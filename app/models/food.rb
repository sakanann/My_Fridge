class Food < ApplicationRecord
  has_many :food_stocks,dependent: :destroy
  has_many :user, through: :food_stocks
end
