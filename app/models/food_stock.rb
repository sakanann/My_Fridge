class FoodStock < ApplicationRecord
  belongs_to :user
  belongs_to :food
  def start_time
    self.use_up_on #self.の後はsimple_calendarに表示させるためのカラムを指定
  end
end
