require 'rails_helper'

RSpec.describe FoodStock, type: :model do
  describe 'バリデーションのテスト' do
    let(:food) { create(:food) }
    let(:user) { create(:user) }
    
    it '必要な情報が全て入力されていれば有効であること' do
      food_stock = FoodStock.new(use_up_on: 2023, 9 , 6 , price: 500, consumption: false, notes: "ai")
      expect(food_stock).to be_valid
    end
    
    it 'userが存在しなければ無効であること' do
      food_stock = build(:food_stock, user: nil)
      food_stock.valid?
      expect(food_stock.errors[:user]).to include('を入力してください')
    end
    
    it 'foodが存在しなければ無効であること' do
      food_stock = build(:food_stock, food: nil)
      food_stock.valid?
      expect(food_stock.errors[:food]).to include('を入力してください')
    end
    
    it 'use_up_onが過去の日付であれば無効であること' do
      food_stock = build(:food_stock, use_up_on: Date.yesterday, food: food, user: user)
      food_stock.valid?
      expect(food_stock.errors[:use_up_on]).to include('は今日以降のものを選択してください')
    end
  end
  
  describe 'メソッドのテスト' do
    let(:food) { create(:food) }
    let(:user) { create(:user) }
    
    it 'start_timeメソッドが期待通り機能すること' do
      food_stock = build(:food_stock, use_up_on: '2023-03-01', food: food, user: user)
      expect(food_stock.start_time).to eq(food_stock.use_up_on)
    end
    
    it 'ransackable_attributesメソッドが期待通り機能すること' do
      expect(FoodStock.ransackable_attributes).to include("consumption", "created_at", "food_id", "id", "notes", "price", "updated_at", "use_up_on", "user_id")
    end
    
    it 'ransackable_associationsメソッドが期待通り機能すること' do
      expect(FoodStock.ransackable_associations).to include("food", "user")
    end
  end
end