FactoryBot.define do
  factory :food_stock do
    association :food
    association :user


    use_up_on { '坂本' }
    price { 100 }
    consumption { false }
    notes { 'memo' }
  end
end
