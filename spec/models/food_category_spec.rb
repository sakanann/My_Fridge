require 'rails_helper'

RSpec.describe FoodCategory, type: :model do
  describe 'バリデーションテスト' do
    it '正しいカテゴリ名を持つ場合、有効であることを確認する' do
      food_category = build(:food_category, name: 'Example')
      expect(food_category).to be_valid
    end

    it 'カテゴリ名が空欄の場合、エラーメッセージが表示されることを確認する' do
      food_category = build(:food_category, name: nil)
      food_category.valid?
      expect(food_category.errors[:name]).to include("を入力してください")
    end

    it 'カテゴリ名が正しく設定されていない場合、無効であることを確認する' do
      food_category = FoodCategory.new(name: "")
      expect(food_category).not_to be_valid
    end

    it 'カテゴリ名が正しく設定されている場合、有効であることを確認する' do
      food_category = FoodCategory.new(name: "肉類")
      expect(food_category).to be_valid
    end
  end
end