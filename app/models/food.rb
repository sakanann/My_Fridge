class Food < ApplicationRecord
  has_many :food_stocks,dependent: :destroy
  has_many :user, through: :food_stocks
  belongs_to :food_category

  #食品名バリデーション：空欄ダメだよ！
  validates :name, presence: true
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "food_category_id", "id", "name", "updated_at"]
  end
end
