class FoodStock < ApplicationRecord
  belongs_to :user
  belongs_to :food
  def start_time
    self.use_up_on #self.の後はsimple_calendarに表示させるためのカラムを指定
  end

  def self.ransackable_attributes(auth_object = nil)
    ["consumption", "created_at", "food_id", "id", "notes", "price", "updated_at", "use_up_on", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["food", "user"]
  end
end
