require 'rails_helper'

RSpec.describe FoodStock, type: :model do
  let(:user) { User.create(name: 'takahashi', email: 'takahashi@gmail.com', password: 'takahashi') }
  let(:food_category) { FoodCategory.create(name: 'テストカテゴリー') }
  let(:food) { Food.create(name: 'テスト食品', food_category: food_category) }

  describe 'validations' do
    it 'is not valid without a user_id' do
      food_stock = FoodStock.new(use_up_on: 2025-07-19, price: 150, consumption: true, notes: '頼む', food_id: food.id)
      expect(food_stock).not_to be_valid
    end

    it 'is not valid without a food_id' do
      food_stock = FoodStock.new(use_up_on: 2025-07-19, price: 150, consumption: true, notes: '頼む', user_id: user.id)
      expect(food_stock).not_to be_valid
    end
  end

  describe 'validations takahashi' do
    it 'is valid with valid attributes' do
      user = User.create(name: 'takahashi', email: 'takahashi@gmail.com', password: 'takahashi')
      food_stock = FoodStock.new(
        use_up_on: 2025-07-19,
        price: 150,
        consumption: true,
        notes: '頼む',
        user_id: user.id,
        food_id: food.id
      )
      expect(food_stock).to be_valid
    end

    it 'is valid with valid attributes メモ30文字以内' do
      user = User.create(name: 'takahashi', email: 'takahashi@gmail.com', password: 'takahashi')
      food_stock = FoodStock.new(
        use_up_on: 2025-07-19,
        price: 150,
        consumption: true,
        notes: '*30ありがとうございます*30ありがとうございます*30',
        user_id: user.id,
        food_id: food.id
      )
      expect(food_stock).to be_valid
    end

    it 'is not valid with valid attributes メモ30文字以上' do
      user = User.create(name: 'takahashi', email: 'takahashi@gmail.com', password: 'takahashi')
      food_stock = FoodStock.new(
        use_up_on: 2025-07-19,
        price: 150,
        consumption: true,
        notes: 'ありがとうございます*30ありがとうございます*30ありがとうございます*30ありがとうございます*30ありがとうございます*30ありがとうございます*30',
        user_id: user.id,
        food_id: food.id
      )
      expect(food_stock).not_to be_valid
    end
  end
end