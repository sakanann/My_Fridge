class Food < ApplicationRecord
  has_many :food_stocks,dependent: :destroy
end
