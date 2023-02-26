FactoryBot.define do
  factory :food_stock do
    use_up_on { '坂本' }
    price { 100 }
    consumption { false }
    notes { 'memo' }
  end
end
